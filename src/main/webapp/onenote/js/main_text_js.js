function textGrouping(e) {
    target = e.target;
    group = e.target.findAncestor(".group");
    
    if (target.hasName('text')) {
        
        layer = group.findAncestor('Layer');
        rect = group.findOne('.rect');
        tf = group.findOne('.tf');
        textNode = group.findOne('.text');
        placeHolder = group.findOne('.placeHolder');
    } else {
        return;
    }
}

function rectResize(){
    //Rect 크기 조절
    scaleX = textNode.getAbsoluteScale().x;
    scaleY = textNode.getAbsoluteScale().y;
    rect.width(textNode.width() * scaleX);
    rect.height(textNode.height() * scaleY);

    rect.show();
}


//text 이동 했을때
stage.on('dragmove', function (e) {
	
	//text 그룹핑
	textGrouping(e);
    
    //글자 이동중 배경색 같이 이동
    var move_point = textNode.absolutePosition();
    rect.x(move_point.x);
    rect.y(move_point.y);
    rect.show();
    			
    layer.draw();
});

//text 이동 끝났을 때
stage.on('dragend', function (e) {
    selectNode = e.target;
    
    textStyle(); //textStyle 메뉴 초기화


    placeHolder.x(move_point.x);
    placeHolder.y(move_point.y);
    layer.draw();
});


stage.on('click', (e) => {

    textGrouping(e);

    group = e.target.findAncestor("Group");


    if (target.nodeType === 'Stage') {

        tf.hide();
        //rect.hide();				%%
        textNode.zIndex(3);
        layer.draw();
        return;
    }


    //text 클릭 했을떄
    if (target.hasName('text')) {
        
        //테두리 크기조정
        rectResize();
        
        textNode.off('transform');
        // 글시 크기 조정 X, 크기조정 툴 사이즈만 변경
        textNode.on('transform', function () {
            // reset scale, so only with is changing by transformer
            textNode.setAttrs({
                width: textNode.width() * textNode.scaleX(),
                scaleX: 1,
                height: textNode.height() * textNode.scaleY(),
                scaleY: 1
            });
        });
        
        layer.draw();
    }


   

});


//textNode.off('dblclick');
//더블클릭 이벤트
stage.on('dblclick', function (e) {

    
    
    if (target.hasName('text')) {
        textGrouping(e);
        
        placeHolder.hide();
        textNode.hide();
        rect.hide();
        tf.show();
        layer.draw();


        // 절대 위치로 캔버스 위에 텍스트 영역 만들기
        // 먼저 텍스트 영역의 위치를 찾아야합니다.
        // 그것을 찾는 방법?

        // 처음에는 스테이지와 관련된 텍스트 노드의 위치를 찾을 수 있습니다.
        var textPosition = textNode.absolutePosition();


        // 그런 다음 페이지에서 스테이지 컨테이너의 위치를 찾을 수 있습니다.
        var stageBox = stage.container().getBoundingClientRect();


        // 텍스트 영역의 위치는 위의 위치의 합계가됩니다.
        var areaPosition = {
            x: stageBox.left + textPosition.x,
            y: stageBox.top + textPosition.y
        };

        // 텍스트 영역을 만들고 스타일을 지정하십시오.
        var textarea = document.createElement('textarea');
        document.body.appendChild(textarea);

        // 캔버스의 텍스트를 최대한 가깝게하기 위해 많은 스타일 적용
        // 캔버스와 텍스트 영역에서의 텍스트 렌더링이 다를 수 있음을 기억하십시오.
        // 그리고 때로는 100 % 동일하게 만들기가 어렵습니다. 그러나 우리는 시도 할 것이다 ...
        textarea.value = textNode.text();
        textarea.style.position = 'absolute';
        textarea.style.top = areaPosition.y + 'px';
        textarea.style.left = areaPosition.x + 'px';
        textarea.style.width = textNode.width() - textNode.padding() * 2 + 'px';
        textarea.style.height =
            textNode.height() - textNode.padding() * 2 + 5 + 'px';
        textarea.style.fontSize = textNode.fontSize() + 'px';
        textarea.style.border = 'none';
        textarea.style.padding = '0px';
        textarea.style.margin = '0px';
        textarea.style.overflow = 'hidden';
        textarea.style.background = 'none';
        textarea.style.outline = 'none';
        textarea.style.resize = 'none';
        textarea.style.lineHeight = textNode.lineHeight();
        textarea.style.fontFamily = textNode.fontFamily();
        textarea.style.transformOrigin = 'left top';
        textarea.style.textAlign = textNode.align();
        textarea.style.color = textNode.fill();

        rotation = textNode.rotation();
        var transform = '';
        if (rotation) {
            transform += 'rotateZ(' + rotation + 'deg)';
        }

        var px = 0;
        // 또한 우리는 약간의 텍스트 영역을 firefox로 옮길 필요가 있습니다.
        // 조금 움직이기 때문에
        var isFirefox =
            navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
        if (isFirefox) {
            px += 2 + Math.round(fontSize / 20);
        }
        transform += 'translateY(-' + px + 'px)';

        //textarea.style.transform = transform;


        // 높이 재설정
        textarea.style.height = 'auto';
        // 브라우저가 크기를 조정 한 후에 실제 값을 설정할 수 있습니다.
        textarea.style.height = textarea.scrollHeight + 3 + 'px';

        textarea.focus();


        function removeTextarea() {

            textarea.parentNode.removeChild(textarea);
            window.removeEventListener('click', handleOutsideClick);
            textNode.show();
            tf.hide();
            tf.forceUpdate();
            layer.draw();

        }

        function setTextareaWidth(newWidth) {
            if (!newWidth) {
                // placeholder의 너비를 설정
                newWidth = textNode.placeholder.length * textNode.fontSize();
            }
            // 다른 브라우저의 몇 가지 추가 수정 사항
            var isSafari = /^((?!chrome|android).)*safari/i.test(
                navigator.userAgent
            );
            var isFirefox =
                navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
            if (isSafari || isFirefox) {
                newWidth = Math.ceil(newWidth);
            }

            var isEdge =
                document.documentMode || /Edge/.test(navigator.userAgent);
            if (isEdge) {
                newWidth += 1;
            }
            textarea.style.width = newWidth + 'px';
        }

        textarea.addEventListener('keydown', function (e) {
            // hide on enter
            // but don't hide on shift + enter
            //if (e.keyCode === 13 && !e.shiftKey)
            if (e.keyCode === 13 && !e.shiftKey) {

                textNode.text(textarea.value);

                //Rect 크기 조절
                scaleX = textNode.getAbsoluteScale().x;
                scaleY = textNode.getAbsoluteScale().y;
                rect.width(textNode.width() * scaleX);
                rect.height(textNode.height() * scaleY);


                if (textNode.text() == '') {
                    placeHolder.show();
                } else {
                    placeHolder.hide();
                }


                removeTextarea();

            }
            // on esc do not set value back to node
            if (e.keyCode === 27) {

                removeTextarea();
            }



        });


        textarea.addEventListener('keydown', function (e) {
            scale = textNode.getAbsoluteScale().x;
            setTextareaWidth(textNode.width() * scale);
            textarea.style.height = 'auto';
            textarea.style.height =
                textarea.scrollHeight + textNode.fontSize() + 'px';
        });



        //textarea 가 아닐경우 textArea 삭제
        function handleOutsideClick(e) {
            if (e.target !== textarea) {


                if (textNode.text() === '') {
                    placeHolder.show();
                }

                removeTextarea();

            }
        }
        setTimeout(() => {
            window.addEventListener('click', handleOutsideClick);

        });


    }

}); //더블클릭 끝




function addText(position, node_num) {
    group = new Konva.Group({
        name: 'group ' + node_num
    });

    //text 생성 & 레이어 추가
    textNode = new Konva.Text({

        //text: '',
        x: position.x,
        y: position.y,
        fontSize: 20,
        draggable: true,
        width: 100,
        name: 'text ' + node_num
    });

    placeHolder = new Konva.Text({

        text: '입력',
        x: position.x,
        y: position.y,
        fontSize: 20,
        draggable: true,
        width: 100,
        contentEditable: false,
        name: 'placeHolder ' + node_num
    });

    group.add(placeHolder);
    group.add(textNode);
    

    //크기 조정 툴 생성      
    tf = new Konva.Transformer({
        node: textNode,
        name: 'tf ' + node_num,
        enabledAnchors: ['middle-left', 'middle-right', 'top-right', 'top-left', 'bottom-right', 'bottom-left', 'bottom-center', 'top-center'],
        //텍스트의 최소 너비 설정
        boundBoxFunc: function (oldBox, newBox) {
            newBox.width = Math.max(30, newBox.width);
            newBox.height = Math.max(30, newBox.height);
            return newBox;
        }

    });

    group.add(tf);




    rect = new Konva.Rect({
        x: position.x,
        y: position.y,
        name: 'rect ' + node_num,
        width: textNode.width() * textNode.getAbsoluteScale().x,
        height: textNode.height() * textNode.getAbsoluteScale().y,
        //stroke: 'red',
        //strokeWidth: 2,
        //dash: [10, 2] //테두리 점선 표시

    });



    group.add(rect);
    layer.add(group);
    layer.draw();

} //addText종료
