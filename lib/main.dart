import 'package:flutter/material.dart';
import 'dart:async';
void main() {
 

  runApp(MyApp());
}
int time=0;

class Result extends StatefulWidget {
  const Result({ Key? key }) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}
String scoreText="";
class _ResultState extends State<Result> {
  void Score(){
     if(score>=30)
     setState((){
       scoreText="You did Great!\n\nYour Score is "+ score.toString();
     });
     else if(score<30)
     setState((){
       scoreText="You should try again!\n\nYour Score is "+ score.toString();
     });

       

  }
  void Restart(){
    score=0;
    for(int i=0;i<flags.length;i++)
      flags[i]=false;
    time=0;
    i=0;
    setState((){startx=false;i=0;scoreText=" ";});
    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz()),
                    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,
           appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor:Colors.blueGrey[900],
           title:Text('Result',style:TextStyle(color:Colors.white)),
           centerTitle: true,
           elevation:0,
           ),
           
          body: Scrollbar(
          
          child:  SingleChildScrollView(
         
          child: Container(
          
          child: Center(
          child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double v, Widget? child) {
        return Opacity(
          opacity:v,  
          child:child
          
        );
      },
           
            child: Padding(
              padding: const EdgeInsets.all(100),
              
              child: Column(
              children: [
                 SizedBox(height:20),
                 SizedBox(height:20),
                 ButtonTheme(
                    minWidth:100,
                    height:50,
                 child:RaisedButton(
                          color:Colors.blueGrey[900],
                          textColor:Colors.white,
                          onPressed: () {
                             Score();
                          },
                          child: Text('ViewScore',style:(TextStyle(fontSize:18))),
                        ),),
                   
                        SizedBox(height:20),
                        Text('Or',textAlign:TextAlign.center,
                        style:(TextStyle(fontSize:18))),
                        SizedBox(height:20),

          ButtonTheme(
                    minWidth:100,
                    height:50,
                child: RaisedButton(
                          color:Colors.blueGrey[900],
                          textColor:Colors.white,
                          onPressed: () {
                             Restart();
                          },
                          child: Text('Restart',style:(TextStyle(fontSize:18))),
                        ),),
                        SizedBox(height:20),        
                        SizedBox(height:20),        
                        Text(scoreText,
                        textAlign:TextAlign.center,
                        style:(TextStyle(fontSize:18)))
                        ]
              
              ),),),),),),), 
    );
  }
}
   

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Quiz(),
      
    );
  }
}
bool startx=false;
class Quiz extends StatefulWidget {
  
  @override
  _QuizState createState() => _QuizState();
}
List<bool> flags=[false,false,false];
class Question{
String text="";
String option1="";
String option2="";
String option3="";
int score1=0;
int score2=0;
int score3=0;

Question(String name,String opt1,String opt2,String opt3,int score1,int score2,int score3)
{
  this.text=name;
  this.option1=opt1;
  this.option2=opt2;
  this.option3=opt3;
  this.score1=score1;
  this.score2=score2;
  this.score3=score3;
}
}
int i=0;
int j=0;
int score=0;
bool checked=false;
bool flag=true;
List<Question> ques=[Question("French revolution occured in:","1789-1799","1890-1900","1670-1679",10,0,0),Question("Tower of Pisa was completed in:","1372","1300","1339",10,0,0),
Question("Height of Eiffel tower:","400 m","300 m","500 m",0,10,0),
Question("Height of Leaning tower of Pisa:","87 m","90 m","100 m",10,0,0),
Question("Famous Painting 'Mona Lisa' was made by:","Leonardo da Vinci","Vincent Van Gogh","Raphael",10,0,0),
Question("Pizza was first made in:","Turkey","India","Italy",0,0,10),
];
 
bool click=false;
class _QuizState extends State<Quiz> {
  int h(int s){
    return s;
  }
  void changeFlag(int k)
  {
    setState((){
    for (int i=0;i<flags.length;i++)
    {
        flags[i]=false;
    }
    flags[k]=true;
  });
  }
  int count=0;
  int count1=0;
  int b=-1;
  void next()
  {
     count++;
     b=-1;
     for (int j=0;j<flags.length;j++)
    {
        if(flags[j]==true)
        {
          print(10101);
          b=j;
          break;
        }

    }
    print("b"+b.toString());
    switch(b)
    {
      case 0:
         score+=ques[i].score1;
        // print(100);
         break;
      case 1:
         score+=ques[i].score2;
         break;
      case 2:
         score+=ques[i].score3;
         break; 

     
    }
    setState(() {
      if(i>=5){
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result()),
                    );
      }
      else
      
        i++;
    checked=false;
    for (int j=0;j<flags.length;j++)
    {
        flags[j]=false;
    }

    });
    print(score);
    time=0;
    click=true;
    
  }
  void start()
  {
 
  {
  
  final timer = Timer.periodic(
  const Duration(seconds: 1),
  (timer1) {
   setState(()
    {
    
    if(count>5 || count1>5)
      timer1.cancel();
    else 
    
    {
      if(time==15)
      {
        count1++;
        next();
        
      }
    else time++;
    }
    //print(time);
    });
  
  });
  }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,
           appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor:Colors.blueGrey[900],
           title:Text('Quiz App',style:TextStyle(color:Colors.white)),
           centerTitle: true,
           elevation:0,
           ),
           
          body: Scrollbar(
          
          child:  SingleChildScrollView(
         
          child: Container(
          
          child: Center(
          child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double v, Widget? child) {
        return Opacity(
          opacity:v,  
          child:child
          
        );
      },
           
            child: Padding(
              padding: const EdgeInsets.all(20),
              
              child: Column(
              children: [
                if(!startx)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:250),
                  child: ButtonTheme(
                    minWidth:150,
                    height:60,
                    child: RaisedButton(
                              color:Colors.blueGrey[900],
                              textColor:Colors.white,
                              
                              onPressed: () {
                                 start();
                                 setState((){startx=true;});
                              },
                              child: Text('Start',style:(TextStyle(fontSize:19))),
                              
                            ),
                  ),
                ),
              if(startx)
              
              SizedBox(height:20),
              SizedBox(height:20),
              if(startx)

              Container(
                child: CircularProgressIndicator(
              value: time/15,
              strokeWidth:10,
              backgroundColor: Colors.grey[500],
              valueColor:AlwaysStoppedAnimation<Color>(Colors.blueGrey.shade900),
             
            ),),
              if(startx)
              SizedBox(height:20),
              SizedBox(height:20),
              if(startx)

                Align(                 
      alignment: Alignment.topLeft,child: Text("  Q."+(i+1).toString()+"  "+ques[i].text,style:(TextStyle(fontSize:18)))
      ),
                SizedBox(height:30),
                
                if(startx)
                
                Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(500),
    border: Border.all(color: Colors.blueGrey.shade900)
  ),

  
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                  child: Row(
                    
                    children: [
                    if(startx)
                    ElevatedButton (onPressed: () {h(ques[i].score1);checked=true;
                    changeFlag(0);

                    },
                    
                    child: Text('A'),
                    
                    style: ElevatedButton.styleFrom(
                      primary: flags[0] ? Colors.teal : Colors.blueGrey[900],

                      shape: CircleBorder(),
                  ),
              ),
              if(startx)
              
              Text(ques[i].option1)]
              ),
                ),
              ),
              if(startx)
              
                SizedBox(height:20),
              if(startx)
              
                Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(500),
    border: Border.all(color: Colors.blueGrey.shade900)
  ),
  
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    
                    children: [
                    ElevatedButton (onPressed: () {h(ques[i].score2);
                    changeFlag(1);

                    },
                    child: Text('B'),
                    
                    style: ElevatedButton.styleFrom(
                      primary: flags[1] ? Colors.teal : Colors.blueGrey[900],
                     
                  
                      shape: CircleBorder(),
                  ),
              ),
              Text(ques[i].option2)]
              ),
                ),
              ), 
               SizedBox(height:20),
              if(startx)
              
                Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(500),
    border: Border.all(color: Colors.blueGrey.shade900)
  ),
  
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    
                    children: [
                    ElevatedButton (onPressed: () {h(ques[i].score3);
                    changeFlag(2);
                    
                    },
                    child: Text('C'),
                    
                    style: ElevatedButton.styleFrom(
                      primary: flags[2] ? Colors.teal : Colors.blueGrey[900],
                    
                     
                      shape: CircleBorder(),
                  ),
              ),
              Text(ques[i].option3)]
              ),
                ),
              ),
               SizedBox(height:20),
              
  //               Container(
  //                  decoration: BoxDecoration(
  //                    borderRadius: BorderRadius.circular(500),
  //   border: Border.all(color: Colors.blueGrey[900])
  // ),
  
  //               child:Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Row(
                    
  //                   children: [
  //                   ElevatedButton (onPressed: () {h();
  //                   setState(()=>flag=!flag);
  //                   },
  //                   child: Text('D'),
                    
  //                   style: ElevatedButton.styleFrom(
                      
  //                     primary: flag ? Colors.blueGrey[900] : Colors.teal,
  //                     shape: CircleBorder(),
  //                 ),
  //             ),
  //             Text(ques[0].option1)]
  //             ),
  //               ),
  //             ),   
              SizedBox(height:20),

              if(startx)

              RaisedButton(
                          color:Colors.blueGrey[900],
                          textColor:Colors.white,
                          
                          onPressed: () {
                             next();
                          },
                          child: Text('Next'),
                        ),
                        
              ]
              ),
            ),
          ),
          ),
          ),
          ),
          ),
          );     
  }
  
}
