#funcion que cambia dos elementos de un vector
vector.swap<-function(vector,it1,it2){
  vector2<-vector
  back<-vector[it1]
  vector2[it1]=vector[it2]
  vector2[it2]=back
  return(vector2)
  
  
}
