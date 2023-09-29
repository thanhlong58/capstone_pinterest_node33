 //success=> 200

const succesCode = (res,content,message) => {
    res.status(200).json({
        message,
        statusCode: 200 ,
        content,
        date : new Date()
    });


}


//failed => 400,401,404
const failedCode = (res,content,statusCode,message) => {
    res.status(statusCode).json({
        message,
        statusCode,
        content,
        date : new Date()
    });

}


//error => 500

const errorCode = (res,message) => {
    res.status(500).json({
        message,
        statusCode: 500,
     
        date : new Date()
    });

}

export {
    succesCode,
    failedCode,
    errorCode
}