//범위 선택
var range = new Konva.Rect;

function dragRange() {

    
    
    stage.on('mousedown.R_MD', function () {
        
        stage.container().style.cursor = 'Crosshair';

        console.log('범위선택');
        var position = stage.getPointerPosition();
        var positionX = position.x;
        var positionY = position.y;

        range = new Konva.Rect({
            x: positionX,
            y: positionY,
            name: 'range',
            width: 2,
            height: 2,
            stroke: 'black',
            strokeWidth: 2,
            fill: '#47484B',
            opacity: 0.2
        });



        layer.add(range);
        layer.draw();


        stage.on('mousemove.R_MM', function () {

            var movePoint = stage.getPointerPosition();
            console.log('x : ' + position.x);


            range.width(movePoint.x - positionX);
            range.height(movePoint.y - positionY);


            layer.draw();

        });

        
        stage.on('mouseup.R_MU', function () {
            stage.container().style.cursor = 'Default';
            console.log('끝');
            stage.off('mousemove.R_MM');
            range.destroy();
            layer.draw();
            stage.off('mouseup.R_MU');    
        });
        stage.off('mousedown.R_MD');
        
    });
}


