//shape node 그룹 변수
var shape_group, anchor;

var square, triangle, circle;

var line, arrow, d_arrow;



stage.on('click', function (e) {

    shapeGrouping(e);

    if (target.hasName('square')) {
        square_anchor_E();
    }
    
    if (target.hasName('triangle')) {
        triangle_anchor_E();
    }

    if (target.nodeType === 'Stage') {

        if (anchor != null) {
            anchor.each(function (i) {
                i.hide();
            });
        }
    }
});


//도형 그룹핑
function shapeGrouping(e) {
    target = e.target;
    shape_group = e.target.findAncestor("Group");

    if (target.hasName('square')) {
        layer = group.findAncestor('Layer');
        anchor = group.find('.anchor');
        square = group.findOne('.square');
    } else if (target.hasName('triangle')) {
        layer = group.findAncestor('Layer');
        anchor = group.find('.anchor');
        triangle = group.findOne('.triangle');
    } else {
        return;
    }
}


//anchor 추가
function addAnchor(shape_group, x, y, name) {

    anchor = new Konva.Circle({
        x: x,
        y: y,
        stroke: '#666',
        fill: '#ddd',
        strokeWidth: 2,
        radius: 4,
        name: name,
        draggable: true,
        dragOnTop: false
    });

    anchor.hide();

    shape_group.add(anchor);

}



//도형 그리기
//사각형 그리기
function addSquare(node_num) {

    stage.on('mousedown.S_MD', function () {

        stage.container().style.cursor = 'Crosshair';

        console.log('사각형 그리기');
        var position = stage.getPointerPosition();


        console.log(position.x);
        console.log(position.y);

        square = new Konva.Rect({
            x: position.x,
            y: position.y,
            name: 'square shape ' + node_num,
            width: 1,
            height: 1,
            stroke: 'black',
            strokeWidth: 2,
            //draggable: true,
        });

        shape_group = new Konva.Group({
            name: 'square group ' + node_num,
            draggable: true
        });



        shape_group.add(square);


        layer.add(shape_group);
        layer.draw();

        var movePoint;
        stage.on('mousemove.S_MM', function () {
            console.log('그리자');
            movePoint = stage.getPointerPosition();
            square.width(movePoint.x - position.x);
            square.height(movePoint.y - position.y);


            layer.draw();

        });


        stage.on('mouseup.S_MU', function () {
            stage.container().style.cursor = 'Default';
            console.log('끝');
            stage.off('mousemove.S_MM');

            //anchor 추가
            addAnchor(shape_group, position.x, position.y, 'anchor topLeft');
            addAnchor(shape_group, movePoint.x, position.y, 'anchor topRight');
            addAnchor(shape_group, movePoint.x, movePoint.y, 'anchor bottomRight');
            addAnchor(shape_group, position.x, movePoint.y, 'anchor bottomLeft');

            layer.draw();
            stage.off('mouseup.S_MU');
        });
        stage.off('mousedown.S_MD');


    });

}

//삼각형 그리기
function addTriangle(node_num) {

    var moveTo;
    var movePoint = stage.getPointerPosition();

    stage.on('mousedown.T_MD', function () {

        stage.container().style.cursor = 'Crosshair';

        console.log('삼각형 그리기');
        moveTo = stage.getPointerPosition();

        triangle = new Konva.Shape({
            name: 'triangle shape ' + node_num,
            stroke: 'black',
            strokeWidth: 2,
            //draggable: true,
        });


        shape_group = new Konva.Group({
            name: 'triangle group ' + node_num,
            draggable: true
        });

        shape_group.add(triangle);

        layer.add(shape_group);
        layer.draw();


        stage.on('mousemove.T_MM', function () {
            console.log('그리자');
            movePoint = stage.getPointerPosition();


            function sceneFunc(context, shape) {
                context.beginPath();

                context.moveTo(moveTo.x, moveTo.y);
                context.lineTo(movePoint.x, movePoint.y);

                context.quadraticCurveTo(moveTo.x, movePoint.y, (movePoint.x - ((movePoint.x - moveTo.x) * 2)), movePoint.y);

                context.closePath();

                context.fillStrokeShape(shape);
            }


            triangle.sceneFunc(sceneFunc);

            layer.draw();

        });


        stage.on('mouseup.T_MU', function () {
            stage.container().style.cursor = 'Default';
            console.log('끝');
            stage.off('mousemove.T_MM');

            //anchor 추가
            addAnchor(shape_group, moveTo.x, moveTo.y, 'anchor topMiddle');
            addAnchor(shape_group, movePoint.x, movePoint.y, 'anchor bottomRight');
            addAnchor(shape_group, (movePoint.x - ((movePoint.x - moveTo.x) * 2)), movePoint.y, 'anchor bottomLeft');


            stage.off('mouseup.T_MU');
        });
        stage.off('mousedown.T_MD');

    });


}

//원그리기
function addCircle() {

}

//선그리기
function addLine(node_num) {
    stage.on('mousedown.L_MD', function () {

        stage.container().style.cursor = 'Crosshair';

        console.log('화살표 그리기');
        var moveTo = stage.getPointerPosition();

        line = new Konva.Line({

            name: 'line shape ' + node_num,
            fill: 'black',
            stroke: 'black',
            strokeWidth: 2,
            draggable: true
        });
        layer.add(line);
        layer.draw();


        stage.on('mousemove.L_MM', function () {
            console.log('그리는중 ');
            var movePoint = stage.getPointerPosition();
            line.points([moveTo.x, moveTo.y, movePoint.x, movePoint.y]);

            layer.draw();

        });


        stage.on('mouseup.L_MU', function () {
            stage.container().style.cursor = 'Default';
            console.log('끝');
            stage.off('mousemove.L_MM');
            stage.off('mouseup.L_MU');
        });
        stage.off('mousedown.L_MD');

    });
}

//화살표 그리기
function addArrow(node_num) {

    stage.on('mousedown.A_MD', function () {

        stage.container().style.cursor = 'Crosshair';

        console.log('화살표 그리기');
        var moveTo = stage.getPointerPosition();

        arrow = new Konva.Arrow({

            name: 'arrow shape ' + node_num,
            pointerLength: 10,
            pointerWidth: 10,
            fill: 'black',
            stroke: 'black',
            strokeWidth: 2,
            draggable: true
        });
        layer.add(arrow);
        layer.draw();


        stage.on('mousemove.A_MM', function () {
            console.log('그리는중 ');
            var movePoint = stage.getPointerPosition();
            arrow.points([moveTo.x, moveTo.y, movePoint.x, movePoint.y]);

            layer.draw();

        });


        stage.on('mouseup.A_MU', function () {
            stage.container().style.cursor = 'Default';
            console.log('끝');
            stage.off('mousemove.A_MM');
            stage.off('mouseup.A_MU');
        });
        stage.off('mousedown.A_MD');

    });
}

//양쪽 화살표 그리기
function addDArrow(node_num) {

    stage.on('mousedown.A_MD', function () {

        stage.container().style.cursor = 'Crosshair';

        console.log('양쪽화살표 그리기');
        var moveTo = stage.getPointerPosition();

        d_arrow = new Konva.Arrow({

            name: 'd_arrow shape ' + node_num,
            pointerLength: 10,
            pointerWidth: 10,
            fill: 'black',
            stroke: 'black',
            strokeWidth: 2,
            draggable: true,
            pointerAtBeginning: true
        });
        layer.add(d_arrow);
        layer.draw();


        stage.on('mousemove.A_MM', function () {
            console.log('그리는중 ');
            var movePoint = stage.getPointerPosition();
            d_arrow.points([moveTo.x, moveTo.y, movePoint.x, movePoint.y]);

            layer.draw();

        });


        stage.on('mouseup.A_MU', function () {
            stage.container().style.cursor = 'Default';
            console.log('끝');
            stage.off('mousemove.A_MM');
            stage.off('mouseup.A_MU');
        });
        stage.off('mousedown.A_MD');

    });
}

//사각형 앵커 효과
function square_anchor_E() {
    anchor.each(function (i) {

        i.show();

        console.log(i);

        i.on('dragmove', function () {
            resize_square(i);
            layer.draw();
        });
        i.on('mousedown touchstart', function () {
            shape_group.draggable(false);
            this.moveToTop();
        });
        i.on('dragend', function () {
            shape_group.draggable(true);
            layer.draw();
        });
        // add hover styling
        i.on('mouseover', function (e) {
            var layer = this.getLayer();
            var over_anchor = e.target;
            if(over_anchor.hasName('topRight')){
                stage.container().style.cursor = 'ne-resize';    
            }
            if(over_anchor.hasName('topLeft')){
                stage.container().style.cursor = 'nw-resize';    
            }
            if(over_anchor.hasName('bottomRight')){
                stage.container().style.cursor = 'se-resize';    
            }
            
            if(over_anchor.hasName('bottomLeft')){
                stage.container().style.cursor = 'sw-resize';    
            }
            this.strokeWidth(4);
            layer.draw();
        });
        i.on('mouseout', function () {
            var layer = this.getLayer();
            stage.container().style.cursor = 'default';    
            this.strokeWidth(2);
            layer.draw();
        });
    });
}



//도형 효과

//사각형 크기 편집
function resize_square(anchor) {
    group = anchor.getParent();


    var topLeft = group.get('.topLeft')[0];
    var topRight = group.get('.topRight')[0];
    var bottomRight = group.get('.bottomRight')[0];
    var bottomLeft = group.get('.bottomLeft')[0];
    var shape;

    if (group.get('.square')[0] != null) {
        shape = group.get('.square')[0];
    } else if (group.get('.triangle')[0] != null) {
        shape = group.get('.triangle')[0];
    }

    var anchorX = anchor.getX();
    var anchorY = anchor.getY();

    // update anchor positions
    switch (anchor.getName()) {
        case 'anchor topLeft':
            topRight.y(anchorY);
            bottomLeft.x(anchorX);
            break;
        case 'anchor topRight':
            topLeft.y(anchorY);
            bottomRight.x(anchorX);
            break;
        case 'anchor bottomRight':
            bottomLeft.y(anchorY);
            topRight.x(anchorX);
            break;
        case 'anchor bottomLeft':
            bottomRight.y(anchorY);
            topLeft.x(anchorX);
            break;
    }

    shape.position(topLeft.position());

    var width = topRight.getX() - topLeft.getX();
    var height = bottomLeft.getY() - topLeft.getY();
    if (width && height) {
        shape.width(width);
        shape.height(height);
    }
}


//삼각형 앵커 효과
function triangle_anchor_E() {
    anchor.each(function (i) {

        i.show();

        console.log(i);

        i.on('dragmove', function () {
            resize_triangle(i);
            layer.draw();
        });
        i.on('mousedown touchstart', function () {
            shape_group.draggable(false);
            this.moveToTop();
        });
        i.on('dragend', function () {
            shape_group.draggable(true);
            layer.draw();
        });
        // add hover styling
        i.on('mouseover', function (e) {
            var layer = this.getLayer();
            
            var over_anchor = e.target;
            if(over_anchor.hasName('bottomRight')){
                stage.container().style.cursor = 'se-resize';    
            }
            
            if(over_anchor.hasName('bottomLeft')){
                stage.container().style.cursor = 'sw-resize';    
            }
            
            if(over_anchor.hasName('topMiddle')){
                stage.container().style.cursor = 'n-resize';    
            }
            
            
            
            this.strokeWidth(4);
            layer.draw();
        });
        i.on('mouseout', function () {
            var layer = this.getLayer();
            stage.container().style.cursor = 'default';
            this.strokeWidth(2);
            layer.draw();
        });
    });
}


//삼각형 크기 편집 (미완)
function resize_triangle(anchor) {
    group = anchor.getParent();

    var topMiddle = group.get('.topRight')[0];
    var bottomRight = group.get('.bottomRight')[0];
    var bottomLeft = group.get('.bottomLeft')[0];
    var shape;

    
    shape = group.get('.triangle')[0];


    var anchorX = anchor.getX();
    var anchorY = anchor.getY();

    // update anchor positions
    switch (anchor.getName()) {
       
        case 'anchor topMiddle':
            topLeft.y(anchorY);
            bottomRight.x(anchorX);
            break;
        case 'anchor bottomRight':
            bottomLeft.y(anchorY);
            topRight.x(anchorX);
            break;
        case 'anchor bottomLeft':
            bottomRight.y(anchorY);
            topLeft.x(anchorX);
            break;
    }

    shape.position(topMiddle.position());

    var width = topRight.getX() - topLeft.getX();
    var height = bottomLeft.getY() - topLeft.getY();
    if (width && height) {
        shape.width(width);
        shape.height(height);
    }
}

