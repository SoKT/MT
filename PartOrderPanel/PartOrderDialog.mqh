//+------------------------------------------------------------------+
//|                                              PartOrderDialog.mqh |
//|                                      Copyright 2016, 05 November |
//|                                                Teemofey@inbox.ru |
//+------------------------------------------------------------------+
#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\ListView.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\SpinEdit.mqh>
#include <Controls\RadioGroup.mqh>
#include <Controls\CheckGroup.mqh>
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
//--- indents and gaps
#define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
#define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
#define INDENT_RIGHT                        (11)      // indent from right (with allowance for border width)
#define INDENT_BOTTOM                       (11)      // indent from bottom (with allowance for border width)
#define CONTROLS_GAP_X                      (10)      // gap by X coordinate
#define CONTROLS_GAP_Y                      (10)      // gap by Y coordinate
//--- for buttons
#define BUTTON_WIDTH                        (100)     // size by X coordinate
#define BUTTON_HEIGHT                       (20)      // size by Y coordinate
//--- for the indication area
#define EDIT_HEIGHT                         (20)      // size by Y coordinate
#define LIST_WIGDHT                         (8)      // size by X coordinate
//+------------------------------------------------------------------+
//| Class PartOrderDialog                                               |
//| Usage: main dialog of the SimplePanel application                |
//+------------------------------------------------------------------+
class PartOrderDialog : public CAppDialog
  {
private:
   CEdit             m_edit;                          // the display field object
   CButton           m_button1;                       // the button object
   CButton           m_button2;                       // the button object
   CButton           m_button3;                       // the fixed button object
   CButton           m_button4;                       // the fixed button object
   CListView         m_list_view;                     // the list object
   CRadioGroup       m_radio_group;                   // the radio buttons group object
   CCheckGroup       m_check_group;                   // the check box group object

public:
                     PartOrderDialog(void);
                    ~PartOrderDialog(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

protected:
   //--- create dependent controls
   bool              CreateEdit(void);
   bool              CreateButton1(void);
   bool              CreateButton2(void);
   bool              CreateButton3(void);
   bool              CreateButton4(void);
   bool              CreateRadioGroup(void);
   bool              CreateCheckGroup(void);
   bool              CreateListView(void);
   //--- internal event handlers
   virtual bool      OnResize(void);
   //--- handlers of the dependent controls events
   void              OnClickButton1(void);
   void              OnClickButton2(void);
   void              OnClickButton3(void);
   void              OnClickButton4(void);
   void              OnChangeRadioGroup(void);
   void              OnChangeCheckGroup(void);
   void              OnChangeListView(void);
   bool              OnDefault(const int id,const long &lparam,const double &dparam,const string &sparam);
  };
//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(PartOrderDialog)
ON_EVENT(ON_CLICK,m_button1,OnClickButton1)
ON_EVENT(ON_CLICK,m_button2,OnClickButton2)
ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
ON_EVENT(ON_CLICK,m_button4,OnClickButton4)
ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)
ON_OTHER_EVENTS(OnDefault)
EVENT_MAP_END(CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
PartOrderDialog::PartOrderDialog(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
PartOrderDialog::~PartOrderDialog(void)
  {
  }
//+------------------------------------------------------------------+
//| Create                                                           |
//+------------------------------------------------------------------+
bool PartOrderDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
      return(false);
//--- create dependent controls
   if(!CreateEdit())
      return(false);
   if(!CreateButton1())
      return(false);
   if(!CreateButton2())
      return(false);
   if(!CreateButton3())
      return(false);
   if(!CreateButton4())
      return(false);
   if(!CreateListView())
      return(false);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the display field                                         |
//+------------------------------------------------------------------+
bool PartOrderDialog::CreateEdit(void)
  {
//--- coordinates
   int x1=INDENT_LEFT;
   int y1=INDENT_TOP;
   int x2=ClientAreaWidth()-(INDENT_RIGHT+BUTTON_WIDTH+CONTROLS_GAP_X);
   int y2=y1+EDIT_HEIGHT;
//--- create
Print("m_name+Edit=",m_name+"Edit");
   if(!m_edit.Create(m_chart_id,m_name+"Edit",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_edit.ReadOnly(true))
      return(false);
   if(!Add(m_edit))
      return(false);
   m_edit.Alignment(WND_ALIGN_WIDTH,INDENT_LEFT,0,INDENT_RIGHT+BUTTON_WIDTH+CONTROLS_GAP_X,0);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the "Button1" button                                      |
//+------------------------------------------------------------------+
bool PartOrderDialog::CreateButton1(void)
  {
//--- coordinates
   int x1=ClientAreaWidth()-(INDENT_RIGHT+BUTTON_WIDTH);
   int y1=INDENT_TOP;
   int x2=x1+BUTTON_WIDTH;
   int y2=y1+BUTTON_HEIGHT;
//--- create
   if(!m_button1.Create(m_chart_id,m_name+"Button1",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_button1.Text("Выключить"))
      return(false);
   if(!Add(m_button1))
      return(false);
   m_button1.Alignment(WND_ALIGN_RIGHT,0,0,INDENT_RIGHT,0);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the "Button2" button                                      |
//+------------------------------------------------------------------+
bool PartOrderDialog::CreateButton2(void)
  {
//--- coordinates
   int x1=ClientAreaWidth()-(INDENT_RIGHT+BUTTON_WIDTH);
   int y1=INDENT_TOP+BUTTON_HEIGHT+CONTROLS_GAP_Y;
   int x2=x1+BUTTON_WIDTH;
   int y2=y1+BUTTON_HEIGHT;
//--- create
   if(!m_button2.Create(m_chart_id,m_name+"Button2",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_button2.Text("Линия уровня"))
      return(false);
   if(!Add(m_button2))
      return(false);
   m_button2.Alignment(WND_ALIGN_RIGHT,0,0,INDENT_RIGHT,0);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the "Button3" fixed button                                |
//+------------------------------------------------------------------+
bool PartOrderDialog::CreateButton3(void)
  {
//--- coordinates
   int x1=ClientAreaWidth()-(INDENT_RIGHT+BUTTON_WIDTH);
   int y1=ClientAreaHeight()-(INDENT_BOTTOM+BUTTON_HEIGHT);
   int x2=x1+BUTTON_WIDTH;
   int y2=y1+BUTTON_HEIGHT;
//--- create
   if(!m_button3.Create(m_chart_id,m_name+"Button3",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_button3.Text("Убрать линии"))
      return(false);
   if(!Add(m_button3))
      return(false);
   m_button3.Locking(true);
   m_button3.Alignment(WND_ALIGN_RIGHT|WND_ALIGN_BOTTOM,0,0,INDENT_RIGHT,INDENT_BOTTOM);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the "Button4" fixed button                                |
//+------------------------------------------------------------------+
bool PartOrderDialog::CreateButton4(void)
  {
//--- coordinates
   int x1=ClientAreaWidth()-(INDENT_RIGHT+BUTTON_WIDTH);
   int y2=ClientAreaHeight()-(INDENT_BOTTOM+BUTTON_HEIGHT+CONTROLS_GAP_Y)+3;
   int y1=y2-BUTTON_HEIGHT;
   int x2=x1+BUTTON_WIDTH;
//--- create
   if(!m_button4.Create(m_chart_id,m_name+"Button4",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_button4.Text("Стоп лосс"))
      return(false);
   if(!Add(m_button4))
      return(false);
   //m_button4.Locking(true);
      m_button4.Alignment(WND_ALIGN_RIGHT,0,0,INDENT_RIGHT,0);
//--- succeed
   return(true);
  }
  


//+------------------------------------------------------------------+
//| Create the "ListView" element                                    |
//+------------------------------------------------------------------+
bool PartOrderDialog::CreateListView(void)
  {
   int sx=(ClientAreaWidth()-(INDENT_LEFT+INDENT_RIGHT+BUTTON_WIDTH))/3-CONTROLS_GAP_X;
//--- coordinates
   int x1=INDENT_LEFT;
//   int y1=INDENT_TOP+EDIT_HEIGHT+CONTROLS_GAP_Y;
   int y1=INDENT_TOP+EDIT_HEIGHT+CONTROLS_GAP_Y;
   int x2=ClientAreaWidth()-(sx+INDENT_RIGHT+BUTTON_WIDTH+CONTROLS_GAP_X)+sx;
   int y2=ClientAreaHeight()-INDENT_BOTTOM;
//--- create
   if(!m_list_view.Create(m_chart_id,m_name+"ListView",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_list_view))
      return(false);
   m_list_view.Alignment(WND_ALIGN_HEIGHT,0,y1,0,INDENT_BOTTOM);
//--- fill out with strings
      for (int i=0; i<=OrdersTotal()-1; i++) 
      {
     if( OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
     if(! m_list_view.ItemAdd((string)OrderTicket()+" "+OrderSymbol()+" Item "+IntegerToString(i)))
               return(false);
         }

//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Handler of resizing                                              |
//+------------------------------------------------------------------+
bool PartOrderDialog::OnResize(void)
  {
  
//--- call method of parent class
   if(!CAppDialog::OnResize()) return(false);
//--- coordinates
   int x=ClientAreaLeft()+INDENT_LEFT;
   int y=m_list_view.Top();
   int sx=(ClientAreaWidth()-(INDENT_LEFT+INDENT_RIGHT+BUTTON_WIDTH))-CONTROLS_GAP_X;
//--- move and resize the "RadioGroup" element
 //  m_radio_group.Move(x,y);
  // m_radio_group.Width(sx);
//--- move and resize the "CheckGroup" element
   x=ClientAreaLeft()+INDENT_LEFT+sx+CONTROLS_GAP_X;
 //  m_check_group.Move(x,y);
  // m_check_group.Width(sx);
//--- move and resize the "ListView" element
 //  x=ClientAreaLeft()+ClientAreaWidth()-(sx+INDENT_RIGHT+BUTTON_WIDTH+CONTROLS_GAP_X);
   x=ClientAreaLeft()+INDENT_LEFT;
   m_list_view.Move(x,y);
   if(m_list_view.Width()!=LIST_WIGDHT&&m_list_view.Width()!=sx)
   m_list_view.Width(sx);
//--- succeed
   return(true);

  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void PartOrderDialog::OnClickButton1(void)
  {
//   m_edit.Text(__FUNCTION__);
//while (m_list_view.Width()<800)
  /*    for (int i=0; i<=m_list_view.Width(); i++) 
      {
     Print(m_list_view.Width());
       m_list_view.Width(m_list_view.Width()-1);
      }*/
            m_list_view.Width(LIST_WIGDHT); 
    //   Print(m_list_view.Width()-1);

//m_list_view.Width(m_list_view.Width()/2);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void PartOrderDialog::OnClickButton2(void)
  {
 //  m_edit.Text(__FUNCTION__);
       int sx=(ClientAreaWidth()-(INDENT_LEFT+INDENT_RIGHT+BUTTON_WIDTH))-CONTROLS_GAP_X;
       int i=0;
/*while (m_list_view.Width()<800)
 //     for (int i=0; i<=sx; i++) 
      {
         Print(i);
         Sleep(1000);       
         m_list_view.Width();   
         i++;     
      }
      if(m_list_view.Width()>0)
      { m_list_view.Width(m_list_view.Width()-1);}
      */
         m_list_view.Width(sx);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void PartOrderDialog::OnClickButton3(void)
  {
   if(m_button3.Pressed())
      m_edit.Text(__FUNCTION__+"On");
   else
      m_edit.Text(__FUNCTION__+"Off");
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void PartOrderDialog::OnClickButton4(void)
  {
Print(StringSubstr(m_edit.Text(),0,4));
//Print(CharToStr(m_edit.Text()[0]));
  // m_edit.Text(__FUNCTION__);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void PartOrderDialog::OnChangeListView(void)
  {
   m_edit.Text("Flag"+__FUNCTION__+" \""+m_list_view.Select()+"\"");
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Rest events handler                                                    |
//+------------------------------------------------------------------+
bool PartOrderDialog::OnDefault(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
//--- restore buttons' states after mouse move'n'click
  // if(id==CHARTEVENT_CLICK)
    //  m_radio_group.RedrawButtonStates();
//--- let's handle event by parent
   return(false);
  }
//+------------------------------------------------------------------+
