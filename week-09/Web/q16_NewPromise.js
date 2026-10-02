function NewPromise(executorFunction) {

    let state = "pending";
    let value; 
    let reason; 

    let handler = []

    function resolve(result) {
        if(state != "pending") return; 

        state = "fulfilled"
        value = result; 

        handler.forEach((x) => {
            if(x.onFulfilled){
                try{
                    let result = x.onFulfilled(value); 
                    x.resolve(result); 
                }catch(error){
                    x.reject(error); 
                }
            }else{
                x.resolve(value); 
            }
        })
    }

    function reject(error) {
        if(state != "pending") return; 

        state = "rejected"
        reason = error;

        handler.forEach((x) => {
            if(x.onRejected){
                try{
                    let result = x.onRejected(reason); 
                    x.resolve(result) 
                }catch(error){
                    x.reject(error)
                }
            }else{
                x.reject(reason); 
            }
        })
    }

    function then(onFulfilled, onRejected) {
        return new NewPromise((newResolve, newReject) => {
            
            if(state == "pending") {
                handler.push({
                    onFulfilled: onFulfilled,
                    onRejected: onRejected,
                    resolve: newResolve,
                    reject: newReject
                }); 
            }
            else if(state == "fulfilled") {
                if(onFulfilled){
                    try {
                        let result = onFulfilled(value); 
                        newResolve(result);
                    } catch (error) {
                        newReject(error); 
                    }
                }else{
                    newResolve(value);
                }
                 
            }
            else if(state == "rejected") {
                if(onRejected){
                    try {
                        let result = onRejected(reason); 
                        newResolve(result);
                    } catch (error) {
                        newReject(error); 
                    }
                }else{
                    newReject(reason);
                }
            }
        })
    }

    function catchh(errorCallback) {
        return then(null, errorCallback);
    }

    executorFunction(resolve, reject); 
}