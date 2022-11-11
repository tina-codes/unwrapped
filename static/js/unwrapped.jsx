// React Components for Unwrapped
let chart;

function createChart(selectedItem) {

    if (chart) {
        chart.destroy();
    };

    chart = new Chart(document.querySelector('#dataChart'), {
        type: 'radar',
        data: {
            labels: [
                'acousticness',
                'danceability',
                'energy',
                'instrumentalness',
                'liveness',
                'speechiness',
                'valence'],
            datasets: [{
                // label: selectedItem.displayText,
                data: selectedItem.featureData,
                fill: true,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgb(255, 99, 132)',
                pointBackgroundColor: 'rgb(255, 99, 132)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(255, 99, 132)'
            }, ]
            },
        options: {
            plugins: {
                legend: {
                    display: false
                },
                title: {
                    display: true,
                    text: selectedItem.displayText
                }
            },
            scales: {
                r: {
                    angleLines: {
                        display: false
                    },
                    suggestedMin: 0,
                    suggestedMax: 1
                }
            }
        },
        });
    };






// Main function that contains everything else
function GetData() {
    const [type, setType] = React.useState('track'); // Set by navbar onClick
    const [viewOptions, setViewOptions] = React.useState([]); // Set by fetch req
    const [view, setView] = React.useState('short_term'); // Set by viewNav onClick
    const [items, setItems] = React.useState([]); // Set by fetch req
    const [selectedItem, setSelectedItem] = React.useState({}); // set by itemNav onClick
    const [parentItem, setParentItem] = React.useState({});
    const [navType, setNavType] = React.useState('track')
    const [profilePhoto, setProfilePhoto] = React.useState('')
    // const [artistCall, setArtistCall] = React.useState(false);
    
    console.log("Rendering GetData component");
    const url = '/get-items';

    React.useEffect(() => {
        console.log('Run UseEffect')
        console.log(type)
        console.log(view)
        const queryUrl = `${url}?item_type=${type}&timespan=${view}`
        fetch(queryUrl)
        .then((response) => response.json())
        .then((data) => {
            setViewOptions(data.viewOptions);
            setItems(data.items);
            setSelectedItem(data.parentItem);
            setParentItem(data.parentItem);
            setNavType(type);
            setProfilePhoto(data.photo);
            });
    }, [type, view]);

    // React.useEffect(() => {
    //     console.log('CALLING TOP ARTISTS');
    //     fetch(`/api/topartists?sendReq=${artistCall}`)
    //     .then(() => {
    //         console.log('Top Artists Complete')
    //     });
    //     return setArtistCall(true)
    // }, []);
        
        

    if (selectedItem != {}) {
        createChart(selectedItem);
    };

    const viewOptionsList = [];    
    
    // console.log(items)

    // const itemOptions = createItemNavs(items);
    
    for (const option of viewOptions) {
        viewOptionsList.push(
          <button className="viewLink" key= {option.timespan} id={option.timespan} onClick={() => setView(option.timespan)}>{option.displayText}</button>
        );
    };

    function displayChart() {
        if (chart) {
            chart.destroy();
        };
        createChart(selectedItem);
    };

    function handleViewSelect() {

    }


    function handleParentSelect(parentItem) {
        console.log("Handle parent select");
        setSelectedItem(parentItem);
        displayChart(selectedItem);
    };

    function handleNonTrackSelect(item) {
        console.log("Handle non track select");
        const parent = item[0]
        const tracklist = item[1]['items']
        console.log(tracklist)
        setNavType('track')
        setSelectedItem(parent);
        setParentItem(parent);
        setItems(tracklist);
        displayChart(selectedItem);
    };

    function handleItemSelect(item) {
        console.log("Handle item select");
        setSelectedItem({'itemId': item.itemId,
                            'displayText': item.displayText,
                            'featureData': item.featureData,
                            'itemType': item.itemType});
        displayChart(selectedItem);
    };

    function handleNavClick(newType) {
        console.log("Handle nav click");
        setType(newType);
        setView('short_term');
    };

    function CreateItemNavs(props) {

        console.log("Creating Item Navs")
        console.log(props.type)
        const itemOptions = [];
        
        if ((props.type === 'genre') || (props.type === 'artist')) {
            console.log('type not track')
            console.log(props.type)
            for (const item of props.items) {
                const itemId = item[0]['itemId']
                const displayText = item[0]['displayText']
                // // console.log(thing)
                // if (thing.length > 0) {
                //     // console.log(thing[0])
                //     console.log(thing[0]['itemId'])
                //     console.log(thing[0]['displayText'])
                // } else {
                //     console.log('Empty')
                //     // console.log(thing)
                // };
                // // console.log(thing[0]['itemId'])
                // // const displayText = item[0]['displayText']
                itemOptions.push(
                    <li key={itemId}><button className="itemLink" id={itemId} onClick={() => handleNonTrackSelect(item)}>{displayText}</button></li>
                    // <li key={item.itemId}><button className="itemLink"  id={item.itemId} onClick={() => handleItemSelect(item)}>{item.displayText}</button></li>
                );
                };
        } else {
            console.log('type is track')
            console.log(props.type)
            for (const item of props.items) {
                itemOptions.push(
                    <li key={item.itemId}><button className="itemLink"  id={item.itemId} onClick={() => handleItemSelect(item)}>{item.displayText}</button></li>
                );
                };
        };
        return (
            <React.Fragment>
                {itemOptions}
            </React.Fragment> 
            );
    };


    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <div className="col">
                        <div id="navBar">
                        <button className="navbar" id="track" onClick={() => handleNavClick('tracks')}>Track</button>
                        <button className="navbar" id="artist" onClick={() => handleNavClick('artist')}>Artists</button>
                        <button className="navbar" id="genre" onClick={() => handleNavClick('genre')}>Genres</button>
                        <a href="/profile" className="navbar" id="profile"><img src={profilePhoto}/></a>
                        </div>
                    </div>
                </div>
                <div className="row">
                    <div className="col">
                        <div className="row">
                            <div id="viewNav">
                                {viewOptionsList}
                            </div>
                        </div>
                        <div className="row">
                            <div id="currentItem">
                            <ol>
                            <button className="currView" id={parentItem.itemId} onClick={() => handleParentSelect(parentItem)}>{parentItem.displayText}</button>
                            </ol>
                            </div>
                            <div id="itemNav">
                            <ol><CreateItemNavs items={items} type={navType} /></ol>
                            </div>
                        </div>
                    </div>
                    <div className="col">
                        <div id="displayNav">
                        {/* {displayNavWindow} */}
                        </div>
                        <div id="chartDisplay">
                            <canvas id="dataChart" width="400" height="400"></canvas>
                        </div>
                    </div>
                </div>
                <div className="row">
                    <div className="col">
                        <div id="footer">Footer links go here</div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}




ReactDOM.render(<GetData />, document.querySelector('#root'));


// const displayNavWindow = [];
        
    // if (selectedItem === 'top_tracks') {
    //     const displayNav = [
    //         'acousticness',
    //         'danceability',
    //         'energy',
    //         'instrumentalness',
    //         'liveness',
    //         'speechiness',
    //         'valence'];

    //     for (const option of displayNav) {
    //         displayNavWindow.push(
    //             <button className="displayNav" key={option} id={option}>{option}</button>
    //         );
    //     };
    // } else {
    //     for (const item in items) {
    //         if (item.itemID === selectedItem) {
    //             console.log('later');
    //             console.log(items);
    //             console.log(selectedItem);
    //             displayNavWindow.push(
    //                 <div>{item.artist} - {item.name}</div>
    //             );
    //         };
    //     };
    // };

      // React.useEffect(() => {
    //     let apiRunning = true;
    //     fetch(queryUrl)
    //     .then((response) => {
    //         if (apiRunning) {
    //             response.json()
    //             .then((data) => {
    //                 setViewOptions(data.viewOptions);
    //                 setItems(data.items);
    //                 setSelectedItem(data.parentItem);
    //                 setParentItem(data.parentItem);
    //             });
    //         };
    //     });
    //     return () => {
    //         apiRunning = false;
    //     };
    // }, [type, view]);
    