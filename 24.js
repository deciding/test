var calc= function(arr, res, out){
	if(arr.length==0){
		if(Math.abs(res-24)<0.1)
			console.log(out);
		return;
	}
	var oneAlreadyMultuplied=false;
	for(var i=0;i<arr.length;i++){
		var num=arr[i];
		var newArr=arr.slice(0,i).concat(arr.slice(i+1));
		if(arr.length==4){
			calc(newArr,num,num+"");
			continue;
		}
		for(var j=0;j<4;j++){
			switch(j){
				case 0:
				var newRes=res+num;
				var newOut="("+out+"+"+num+")";
				calc(newArr,newRes,newOut);
				break;
				case 1:
				var newRes=res-num;
				if(newRes>=0){
					var newOut="("+out+"-"+num+")";
					calc(newArr,newRes,newOut);
				}
				else{
					newRes=num-res;
					newOut="("+num+"-"+out+")";
					calc(newArr,newRes,newOut);
				}
				break;
				case 2:
				if(!oneAlreadyMultuplied){
					var newRes=res*num;
					var newOut=out+"*"+num;
					calc(newArr,newRes,newOut);
					if(res==1)
						oneAlreadyMultuplied=true;
				}
				break;
				default:
				if(res==1)
					break;
				var newRes=res/num;
				var newOut=out+"/"+num;
				calc(newArr,newRes,newOut);
				newRes=num/res;
				newOut=num+"/"+out;
				calc(newArr,newRes,newOut);
				break;
			}
		}
	}
}
var calc2= function(arr, out){
	if(arr.length==1){
		if(Math.abs(arr[0]-24)<0.1)
			console.log(out[0]);
		return;
	}
	for(var i=0;i<arr.length-1;i++){
		var num1=arr[i];
		var out1=out[i];
		var oneAlreadyMultuplied=false;
		for(var j=i+1;j<arr.length;j++){
			var num2=arr[j];
			var out2=out[j];
			var newArr=arr.slice(0,i).concat(arr.slice(i+1,j)).concat(arr.slice(j+1));
			var newOut=out.slice(0,i).concat(out.slice(i+1,j)).concat(out.slice(j+1));
			for(var k=0;k<4;k++){
				switch(k){
					case 0:
					var res=num1+num2;
					var outRes="("+out1+"+"+out2+")";
					newArr.unshift(res);
					newOut.unshift(outRes);
					calc2(newArr,newOut);
					newArr.shift();
					newOut.shift();
					break;
					case 1:
					var res=num1-num2;
					if(res>=0){
						var outRes="("+out1+"-"+out2+")";
						newArr.unshift(res);
						newOut.unshift(outRes);
						calc2(newArr,newOut);
						newArr.shift();
						newOut.shift();
					}
					else{
						var res=num2-num1;
						var outRes="("+out2+"-"+out1+")";
						newArr.unshift(res);
						newOut.unshift(outRes);
						calc2(newArr,newOut);
						newArr.shift();
						newOut.shift();
					}
					break;
					case 2:
					if(!oneAlreadyMultuplied){
						var res=num1*num2;
						var outRes="("+out1+"*"+out2+")";
						newArr.unshift(res);
						newOut.unshift(outRes);
						calc2(newArr,newOut);
						newArr.shift();
						newOut.shift();
						if(num1==1)
							oneAlreadyMultuplied=true;
					}
					break;
					default:
					var res,outRes;
					if(num2!=1){
						res=num1/num2;
						outRes="("+out1+"/"+out2+")";
						newArr.unshift(res);
						newOut.unshift(outRes);
						calc2(newArr,newOut);
						newArr.shift();
						newOut.shift();
					}
					if(num1!=1){
						res=num2/num1;
						outRes="("+out2+"/"+out1+")";
						newArr.unshift(res);
						newOut.unshift(outRes);
						calc2(newArr,newOut);
						newArr.shift();
						newOut.shift();
					}
					break;
				}
			}
		}
	}
}
calc2(process.argv.slice(2).map(elem=>parseInt(elem)),process.argv.slice(2).map(elem=>parseInt(elem)));
// calc2([1, 6, 6, 8], ['1', '6','6', '8'])