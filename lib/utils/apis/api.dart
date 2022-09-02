
class Api{

  static const htmlData =
  r"""
  <div class="container" id="form-field">
    <form id="form-data">
        <div class="row">
            <div class="card col-md-12 border border-primary">
                <div class="card-body">
                    <h3 contenteditable="true" title="Enter Title" class="text-center" id="form-title"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 21px; font-weight: 700; white-space: pre-wrap;">Biosyntec New Farmer Assessment Form </span></h3>
                    <hr class="border-primary">
                    <p contenteditable="true" id="form-description" title="Enter Description" class="form-description text-center"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-style: normal; font-weight: 700; white-space: pre-wrap;">What is your view on the following statements?</span></p>
                </div>
                
            </div>
        </div>
        <div>
            <div id="question-field" class="row ml-2 mr-2 ui-sortable highlight">
                <div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="0">
                    <span class="item-move ui-sortable-handle"><i class="fa fa-braille"></i></span>
                    <div class="card-body">
                        <div class="row align-items-center d-flex">
                            <div class="col-sm-8">
                                <p class="question-text m-0" contenteditable="true" title="Write you question here"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">Its very important to make profits than to struggle keeping a strong business relationship in order to develop my self and the community.</span></p>
                            </div>
                            <div class="col-sm-4">
                                <select title="question choice type" name="choice" class="form-control choice-option">
                                    <option value="p">paragraph</option>
                                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                                    <option value="radio">Mupliple choice (single answer)</option>
                                    <option value="file">File upload</option>
                                </select>
                            </div>
                        </div>
                        <hr class="border-dark">
                        <div class="row ">
                            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" >
                            <button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button>
                            </div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc">
                            <input class="form-check-input" name="q[0]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; ">
                            <label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[0]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[0]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span><br></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[0]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
                        </div>
                    </div>
               
                </div>
            
<div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="1">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">If I borrow an item from a neighbour its not always important to handle it with care so long as I can pay when its damaged</span></p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>
 
</div>

<div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="2">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">Its very important to make profits than to struggle keeping a strong business relationship inorder to develop my self and the community.?</span></p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>

</div>

<div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="3">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here">
                <span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">
                Signing a contract with a business partner for 20 years is the right way to have a secure investment for myself and family.?
                </span>
                </p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>
 
</div>



      
 <div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="4">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here">
                <span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px;">
          
                    Avocados just grow naturaly so we dont need to care for them so much as other crops like cotton
                </span>
                </p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc">
            <input class="form-check-input" name="q[4]" type="radio" value="Enter Option">
            <label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;
            A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div>
            <div class="row w-100"><div class="col-sm-1 rem-on-display" >
            <button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option">
            <label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div>
            <div class="row w-100"><div class="col-sm-1 rem-on-display" >
            <button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option"><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" >
            <button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option"><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div>
            <button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>
 
</div>

      
      
      
      
        </div>
  
    </form>
</div>
</body>
</html>
  """;


  static final header = r"""
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta content="" name="description">
    <meta http-equiv="content-type" content="no-cache">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>Assessment Form</title>

</head>
<body>
  """;

  static final footer = r"""
  <script>

  $(function(){
  var button1 = document.getElementById('add_q-item');
  var button2 = document.getElementById('save_form');
  var btn = document.getElementsByClassName('rem-q-item');
  var btn2 = document.getElementsByClassName('add_radio').style.display = 'none';;
  var btn3 =  document.getElementsByClassName('rem-on-display');
  var btn4= document.getElementsByClassName('req-item');
  var btn5 = document.getElementsByClassName('choice-option');
  var btn6 = document.getElementsByClassName('add_chk');
  var editable_elements = document.querySelectorAll("[contenteditable=true]");
  editable_elements[0].setAttribute("contenteditable", false);
  editable_elements[1].setAttribute("contenteditable", false);

    button1.style.display = 'none';
    button2.style.display = 'none';
    for(const btns of btn3){
      btns.style.display = 'none';
    }
    for(const btns of btn){
      btns.style.display = 'none';
    }
    for(const btns of btn2){
      btns.style.display = 'none';
    }
    for(const btns of btn6){
      btns.style.display = 'none';
    }
    for(const btns of btn5){
      btns.style.display = 'none';
    }

  });
</script>
</body>
</html>
  """;



  static const htmlData_modified =
  r"""
  <div class="container" id="form-field">
    <form id="form-data">
        <div class="row">
            <div class="card col-md-12 border border-primary">
                <div class="card-body">
                    <h3 contenteditable="true" title="Enter Title" class="text-center" id="form-title"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 21px; font-weight: 700; white-space: pre-wrap;">Biosyntec New Farmer Assessment Form </span></h3>
                    <hr class="border-primary">
                    <p contenteditable="true" id="form-description" title="Enter Description" class="form-description text-center"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-style: normal; font-weight: 700; white-space: pre-wrap;">What is your view on the following statements?</span></p>
                </div>
                
            </div>
        </div>
        <div>
            <div id="question-field" class="row ml-2 mr-2 ui-sortable highlight">
                <div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="0">
                    <span class="item-move ui-sortable-handle"><i class="fa fa-braille"></i></span>
                    <div class="card-body">
                        <div class="row align-items-center d-flex">
                            <div class="col-sm-8">
                                <p class="question-text m-0" contenteditable="true" title="Write you question here"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">Its very important to make profits than to struggle keeping a strong business relationship in order to develop my self and the community.</span></p>
                            </div>
                            <div class="col-sm-4">
                                <select title="question choice type" name="choice" class="form-control choice-option">
                                    <option value="p">paragraph</option>
                                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                                    <option value="radio">Mupliple choice (single answer)</option>
                                    <option value="file">File upload</option>    
                                </select>
                            </div>
                        </div>
                        <hr class="border-dark">
                        <div class="row ">
                            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" id="check" name="q[0]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[0]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[0]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span><br></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[0]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
                        </div>
                    </div>
               
                </div>
            
<div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="1">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">If I borrow an item from a neighbour its not always important to handle it with care so long as I can pay when its damaged</span></p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[1]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>
 
</div>

<div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="2">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here"><span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">Its very important to make profits than to struggle keeping a strong business relationship inorder to develop my self and the community.?</span></p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[2]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>

</div>

<div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="3">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here">
                <span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; white-space: pre-wrap;">
                Signing a contract with a business partner for 20 years is the right way to have a secure investment for myself and family.?
                </span>
                </p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;A&nbsp; &nbsp;Strongly Agree)&nbsp; "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;B&nbsp; &nbsp;&nbsp;Agree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;C&nbsp; &nbsp;Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[3]" type="radio" value="&nbsp;D&nbsp; &nbsp;Strongly Disagree "><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>
 
</div>



      
 <div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="4">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">
        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true" title="Write you question here">
                <span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px;">
          
                    Avocados just grow naturaly so we dont need to care for them so much as other crops like cotton
                </span>
                </p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class="form-control choice-option">
                    <option value="p">paragraph</option>
                    <option value="checkbox">Mupliple choice (multiple answer)</option>
                    <option value="radio">Mupliple choice (single answer)</option>
                    <option value="file">File upload</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12"><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option"><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;A&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Agree</span>)&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;"> </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option"><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;B&nbsp; &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Agree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option"><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;C&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Disagree </span></label></div></div></div><div class="row w-100"><div class="col-sm-1 rem-on-display" ><button class="btn btn-sm btn-default" type="button"><span class="fa fa-times"></span></button></div><div class="col-sm-11 d-flex align-items-center"><div class="form-check q-fc"><input class="form-check-input" name="q[4]" type="radio" value="Enter Option"><label class="form-check-label" contenteditable="true" title="Enter option here">&nbsp;D&nbsp; &nbsp;<span style="color: rgb(0, 0, 0); font-family: docs-Calibri; font-size: 16px; font-weight: 400; white-space: pre-wrap;">Strongly Disagree </span></label></div></div></div><button type="button" class="add_radio btn btn-sm btn-default border"><i class="fa fa-plus"></i> Add option</button></div>
        </div>
    </div>
 
</div>

      
      
      
      
        </div>
  
    </form>
</div>
  """;
}