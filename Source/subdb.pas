unit subdb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask,
  OleCtrls, ShockwaveFlashObjects_TLB,ShellApi, Menus, ComCtrls, Buttons;

Const WM_NOTIFYICON = WM_USER+333;

type
  TForm2 = class(TForm)
    Table1: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    MaskEdit1: TMaskEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox1: TComboBox;
    MaskEdit2: TMaskEdit;
    ShockwaveFlash1: TShockwaveFlash;
    PopupMenu1: TPopupMenu;
    Restore1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    StringGrid1: TStringGrid;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Animate1: TAnimate;
    procedure FormShow(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure MaskEdit2Enter(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure ShockwaveFlash1FSCommand(ASender: TObject; const command,
      args: WideString);
    procedure Restore1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit8Enter(Sender: TObject);
    procedure Edit9Enter(Sender: TObject);
    procedure Edit10Enter(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
  private
    procedure CMClickIcon(var msg: TMessage);message WM_NOTIFYICON;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Tnid: TnotifyIconData;
  Icon: TIcon;
  lSave,tSave: Integer;
  piccomb: String;
  SearchFLD,SearchType: String;
  Found: Boolean;
  BTCOMMAND: String;

implementation

uses main;

{$R *.dfm}

procedure TForm2.CMClickIcon(var msg:TMessage);
var
  pt:TPoint;
begin
  GetCursorPos(pt);
  case msg.LParam of
    WM_LBUTTONDBLCLK:
      Begin
        Form2.Left :=lSave;
        Form2.Top :=tSave;
        Shell_NotifyIcon(NIM_DELETE, @Tnid);
      End;
    WM_RBUTTONUP: PopupMenu1.Popup (pt.X,pt.Y);
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
var CurDir:array[0..255] of char;
begin
  GetCurrentDirectory(2255,CurDir);
  ShockwaveFlash1.Movie:=CurDir+'\subgui.swf';
  GetCurrentDirectory(2255,CurDir);
  Table1.TableName :=CurDir+'\DB.DB';
  Table1.Active :=True;
  Animate1.Visible :=False;
  DBGrid1.Columns[0].Title.Caption:='—œÌ›';
  DBGrid1.Columns[1].Title.Caption:='⁄‰Ê«‰ ò «»';
  DBGrid1.Columns[2].Title.Caption:='„Ê·›';
  DBGrid1.Columns[3].Title.Caption:='„ —Ã„';
  DBGrid1.Columns[4].Title.Caption:='‰«‘—';
  DBGrid1.Columns[5].Title.Caption:='‰Ê»  ç«Å';
  DBGrid1.Columns[6].Title.Caption:='”«· ç«Å';
  DBGrid1.Columns[7].Title.Caption:='„Õ· ç«Å';
  DBGrid1.Columns[8].Title.Caption:=' ⁄œ«œ ’›Õ« ';
  DBGrid1.Columns[9].Title.Caption:='„’Ê—';
  DBGrid1.Columns[10].Title.Caption:=' «—ÌŒ  Õ’Ì·';
  Edit8.Text :='Ã” ÃÊ »— «”«” ⁄‰Ê«‰ ò «»';
  Edit9.Text :='Ã” ÃÊ »— «”«” ‰«„ „Ê·›';
  Edit10.Text :='Ã” ÃÊ »— «”«” „Ê÷Ê⁄';
  ProgressBar3.Visible :=False;
  ProgressBar2.Visible :=False;
  ProgressBar1.Visible :=False;
  StringGrid1.ColCount :=5;
  StringGrid1.RowCount :=2;
  StringGrid1.Cols[1].Add('⁄‰Ê«‰');
  StringGrid1.Cols[2].Add('„Ê·›');
  StringGrid1.Cols[3].Add('„ —Ã„');
  StringGrid1.Cols[4].Add('‰«‘—');
  Timer1.Enabled :=False;
  StringGrid1.Rows [1].Clear;
  StringGrid1.ColWidths[0]:=100;
  StringGrid1.ColWidths[1]:=150;
  StringGrid1.ColWidths[2]:=150;
  StringGrid1.ColWidths[3]:=150;
  StringGrid1.ColWidths[4]:=150;
  DBGrid1.SelectedIndex :=0;
  Table1.FindLast;
end;

procedure TForm2.Edit1Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=0;
end;

procedure TForm2.Edit2Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=2;
end;

procedure TForm2.Edit3Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=3;
end;

procedure TForm2.Edit4Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=4;
end;

procedure TForm2.Edit5Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=5;
end;

procedure TForm2.MaskEdit1Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=6;
end;

procedure TForm2.Edit6Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=7;
end;

procedure TForm2.Edit7Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=8;
end;

procedure TForm2.ComboBox1Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=9;
  piccomb :=ComboBox1.Text;
end;

procedure TForm2.MaskEdit2Enter(Sender: TObject);
begin
  DBGrid1.SelectedIndex :=10;
end;

procedure TForm2.Table1AfterScroll(DataSet: TDataSet);
begin
  If BTCOMMAND<>'save' Then
  Begin
  DBGrid1.SelectedIndex :=1;
  Edit1.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=2;
  Edit2.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=3;
  Edit3.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=4;
  Edit4.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=5;
  Edit5.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=6;
  MaskEdit1.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=7;
  Edit6.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=8;
  Edit7.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=9;
  ComboBox1.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=10;
  MaskEdit2.Text :=Trim(DBGrid1.SelectedField.Text);
  DBGrid1.SelectedIndex :=0;
  End;
  BTCOMMAND :='';
end;

procedure TForm2.ShockwaveFlash1FSCommand(ASender: TObject; const command,
  args: WideString);
begin
  If Command='systemtray' Then
    Begin
      Icon:=TIcon.Create;
      Icon.Assign(application.Icon);
      Shell_NotifyIcon(NIM_DELETE, @Tnid);
      tnid.cbSize :=SizeOf(TNotifyIconData);
      tnid.Wnd :=Form2.Handle;
      tnid.uID :=1;tnid.uFlags :=NIF_MESSAGE or NIF_ICON or NIF_TIP;
      tnid.uCallbackMessage :=WM_NOTIFYICON;
      tnid.hIcon :=Icon.Handle;
      tnid.szTip :='ò·Ìò —«” : „‰ÊÌ »—‰«„Â / œ«»· ò·Ìò: »«“ ê‘  »Â »—‰«„Â';
      Shell_NotifyIcon(NIM_ADD, @Tnid);
      ShowWindow(application.Handle,SW_HIDE);
      Form2.Left :=Form2.Left +20000;
      Form2.Top :=Form2.Top +20000;
    End;
  If Command='return' Then
    Begin
      Form1.Show;
      Form2.Hide;
    End;
end;

procedure TForm2.Restore1Click(Sender: TObject);
begin
        Form2.Left :=lSave;
        Form2.Top :=tSave;
        Shell_NotifyIcon(NIM_DELETE, @Tnid);
end;

procedure TForm2.About1Click(Sender: TObject);
begin
  MessageDlg('«Ì‰ ﬁ”„  œ— Õ«· Õ«÷— ﬁ«»· «Ã—« ‰„Ì »«‘œ', mtInformation, [mbOK], 0)
end;

procedure TForm2.Exit1Click(Sender: TObject);
begin
        Shell_NotifyIcon(NIM_DELETE, @Tnid);
        Halt;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  If piccomb<>ComboBox1.Text Then ComboBox1.Text :=piccomb;
end;

procedure TForm2.ComboBox1Select(Sender: TObject);
begin
  piccomb :=ComboBox1.Text;
end;

procedure TForm2.Edit8Enter(Sender: TObject);
begin
  Timer1.Enabled :=False;
  Edit9.Text :='Ã” ÃÊ »— «”«” ‰«„ „Ê·›';
  Edit10.Text :='Ã” ÃÊ »— «”«” „Ê÷Ê⁄';
  Edit8.Clear;
end;

procedure TForm2.Edit9Enter(Sender: TObject);
begin
  Timer1.Enabled :=False;
  Edit8.Text :='Ã” ÃÊ »— «”«” ⁄‰Ê«‰ ò «»';
  Edit10.Text :='Ã” ÃÊ »— «”«” „Ê÷Ê⁄';
  Edit9.Clear;
end;

procedure TForm2.Edit10Enter(Sender: TObject);
begin
  Timer1.Enabled :=False;
  Edit8.Text :='Ã” ÃÊ »— «”«” ⁄‰Ê«‰ ò «»';
  Edit9.Text :='Ã” ÃÊ »— «”«” ‰«„ „Ê·›';
  Edit10.Clear;
end;

procedure TForm2.Edit8Exit(Sender: TObject);
begin
  SearchFLD :=Edit8.Text;
  Edit8.Text :='Ã” ÃÊ »— «”«” ⁄‰Ê«‰ ò «»';
  SearchType :='1';
end;

procedure TForm2.Edit9Exit(Sender: TObject);
begin
  SearchFLD :=Edit9.Text;
  Edit9.Text :='Ã” ÃÊ »— «”«” ‰«„ „Ê·›';
  SearchType :='2';
end;

procedure TForm2.Edit10Exit(Sender: TObject);
begin
  SearchFLD :=Edit10.Text;
  Edit10.Text :='Ã” ÃÊ »— «”«” „Ê÷Ê⁄';
  SearchType :='3';
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Edit8.Text :='Ã” ÃÊ »— «”«” ⁄‰Ê«‰ ò «»';
  Edit9.Text :='Ã” ÃÊ »— «”«” ‰«„ „Ê·›';
  Edit10.Text :='Ã” ÃÊ »— «”«” „Ê÷Ê⁄';
  Timer1.Enabled :=False;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Halt;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Animate1.Visible :=True;
  Animate1.CommonAVI :=aviFindFile;
  Animate1.Play(1,8,0);
  StringGrid1.RowCount:=2;
  StringGrid1.FixedRows :=1;
  StringGrid1.Rows[1].Clear;
  If (SearchFLD<>'Ã” ÃÊ »— «”«” ⁄‰Ê«‰ ò «»') and (SearchFLD<>'') and (Edit8.Text<>'ò «» „Ê—œ ‰Ÿ— Ì«›  ‰‘œ') and (SearchType = '1') Then
  If Table1.RecordCount>0 Then
    Begin
      ProgressBar1.Min:=1;
      ProgressBar1.StepBy(DBGrid1.DataSource.DataSet.RecordCount*(-1));
      ProgressBar1.Max:=DBGrid1.DataSource.DataSet.RecordCount+1;
      ProgressBar1.Visible :=True;
      Table1.FindLast;
      Found :=False;
      Repeat
      DBGrid1.SelectedIndex:=1;
        If SearchFLD = DBGrid1.SelectedField.Text Then
          Begin
            Found :=True;
            StringGrid1.Rows[StringGrid1.RowCount-1].Add('ò «» / '+IntToStr(Table1.RecNo));
            StringGrid1.Rows[StringGrid1.RowCount].Clear;
            DBGrid1.SelectedIndex :=1;
            StringGrid1.Cells [1,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=2;
            StringGrid1.Cells [2,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=3;
            StringGrid1.Cells [3,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=4;
            StringGrid1.Cells [4,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            StringGrid1.RowCount :=StringGrid1.RowCount+1;
          End;
        ProgressBar1.StepBy(1);
      Until Table1.FindPrior=False;
      If Found=False Then
        Begin
          StringGrid1.Rows[StringGrid1.RowCount-1].Add('ò «» / »Ì ‰ ÌÃÂ');
          StringGrid1.Cells [1,StringGrid1.RowCount-1] :=SearchFLD;
          Edit8.Text :='ò «» „Ê—œ ‰Ÿ— Ì«›  ‰‘œ';
        End;
      ProgressBar1.Visible :=False;
    End
  Else
    Edit8.Text:='ÃœÊ· Œ«·Ì «” ';
  DBGrid1.SelectedIndex :=0;
  Timer1.Enabled :=True;
  SearchFLD :='';
  SearchType :='0';
  Table1.FindLast;
  Animate1.Stop;
  Animate1.Visible :=False;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Animate1.Visible :=True;
  Animate1.CommonAVI :=aviFindFile;
  Animate1.Play(1,8,0);
  StringGrid1.RowCount:=2;
  StringGrid1.FixedRows :=1;
  StringGrid1.Rows[1].Clear;
  If (SearchFLD<>'Ã” ÃÊ »— «”«” ‰«„ „Ê·›') and (SearchFLD<>'') and (Edit9.Text<>'«À—Ì «“ „Ê·› „Ê—œ ‰Ÿ— Ì«›  ‰‘œ') and (SearchType = '2') Then
  If Table1.RecordCount>0 Then
    Begin
      ProgressBar2.Min:=1;
      ProgressBar2.StepBy(DBGrid1.DataSource.DataSet.RecordCount*(-1));
      ProgressBar2.Max:=DBGrid1.DataSource.DataSet.RecordCount+1;
      ProgressBar2.Visible :=True;
      Table1.FindLast;
      Found :=False;
      Repeat
      DBGrid1.SelectedIndex:=2;
        If SearchFLD = DBGrid1.SelectedField.Text Then
          Begin
            Found :=True;
            StringGrid1.Rows[StringGrid1.RowCount-1].Add('„Ê·› / '+IntToStr(Table1.RecNo));
            StringGrid1.Rows[StringGrid1.RowCount].Clear;
            DBGrid1.SelectedIndex :=1;
            StringGrid1.Cells [1,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=2;
            StringGrid1.Cells [2,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=3;
            StringGrid1.Cells [3,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=4;
            StringGrid1.Cells [4,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            StringGrid1.RowCount :=StringGrid1.RowCount+1;
          End;
        ProgressBar2.StepBy(1);
      Until Table1.FindPrior=False;
      If Found=False Then
        Begin
          StringGrid1.Rows[StringGrid1.RowCount-1].Add('„Ê·› / »Ì ‰ ÌÃÂ');
          StringGrid1.Cells [2,StringGrid1.RowCount-1] :=SearchFLD;
          Edit9.Text :='«À—Ì «“ „Ê·› „Ê—œ ‰Ÿ— Ì«›  ‰‘œ';
        End;
      ProgressBar2.Visible :=False;
    End
  Else
    Edit9.Text:='ÃœÊ· Œ«·Ì «” ';
  DBGrid1.SelectedIndex :=0;
  Timer1.Enabled :=True;
  SearchFLD :='';
  SearchType :='0';
  Table1.FindLast;
  Animate1.Stop;
  Animate1.Visible :=False;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Animate1.Visible :=True;
  Animate1.CommonAVI :=aviFindFile;
  Animate1.Play(1,8,0);
  StringGrid1.RowCount:=2;
  StringGrid1.FixedRows :=1;
  StringGrid1.Rows[1].Clear;
  If (SearchFLD<>'Ã” ÃÊ »— «”«” „Ê÷Ê⁄') and (SearchFLD<>'') and (Edit10.Text<>'ò «»Ì œ— „Ê÷Ê⁄ „Ê—œ ‰Ÿ— ÊÃÊœ ‰œ«—œ') and (SearchType = '3') Then
  If Table1.RecordCount>0 Then
    Begin
      ProgressBar3.Min:=1;
      ProgressBar3.StepBy(DBGrid1.DataSource.DataSet.RecordCount*(-1));
      ProgressBar3.Max:=DBGrid1.DataSource.DataSet.RecordCount+1;
      ProgressBar3.Visible :=True;
      Table1.FindLast;
      Found :=False;
      Repeat
      DBGrid1.SelectedIndex:=1;
        If POS(SearchFLD,DBGrid1.SelectedField.Text)<>0 Then
          Begin
            Found :=True;
            StringGrid1.Rows[StringGrid1.RowCount-1].Add('„Ê÷Ê⁄ / '+IntToStr(Table1.RecNo));
            StringGrid1.Rows[StringGrid1.RowCount].Clear;
            DBGrid1.SelectedIndex :=1;
            StringGrid1.Cells [1,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=2;
            StringGrid1.Cells [2,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=3;
            StringGrid1.Cells [3,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            DBGrid1.SelectedIndex :=4;
            StringGrid1.Cells [4,StringGrid1.RowCount-1] :=Trim(DBGrid1.SelectedField.Text);
            StringGrid1.RowCount :=StringGrid1.RowCount+1;
          End;
        ProgressBar3.StepBy(1);
      Until Table1.FindPrior=False;
      If Found=False Then
        Begin
          StringGrid1.Rows[StringGrid1.RowCount-1].Add('„Ê÷Ê⁄ / »Ì ‰ ÌÃÂ');
          StringGrid1.Cells [1,StringGrid1.RowCount-1] :=SearchFLD;
          Edit10.Text :='ò «»Ì œ— „Ê÷Ê⁄ „Ê—œ ‰Ÿ— ÊÃÊœ ‰œ«—œ';
        End;
      ProgressBar3.Visible :=False;
    End
  Else
    Edit10.Text:='ÃœÊ· Œ«·Ì «” ';
  DBGrid1.SelectedIndex :=0;
  Timer1.Enabled :=True;
  SearchFLD :='';
  SearchType :='0';
  Table1.FindLast;
  Animate1.Stop;
  Animate1.Visible :=False;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
  Table1.Insert;
  Table1.Cancel;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
  BTCOMMAND :='save';
  If Trim(Edit1.Text)<>'' Then
  Begin
  Table1.Edit;
  DBGrid1.SelectedIndex :=0;
  If Trim(DBGrid1.SelectedField.Text)='' Then
    DBGrid1.SelectedField.Text :=IntToStr(Table1.RecordCount+1);
  DBGrid1.SelectedIndex :=1;
  DBGrid1.SelectedField.Text :=Trim(Edit1.Text);
  DBGrid1.SelectedIndex :=2;
  DBGrid1.SelectedField.Text :=Trim(Edit2.Text);
  DBGrid1.SelectedIndex :=3;
  DBGrid1.SelectedField.Text :=Trim(Edit3.Text);
  DBGrid1.SelectedIndex :=4;
  DBGrid1.SelectedField.Text :=Trim(Edit4.Text);
  DBGrid1.SelectedIndex :=5;
  DBGrid1.SelectedField.Text :=Trim(Edit5.Text);
  DBGrid1.SelectedIndex :=6;
  DBGrid1.SelectedField.Text :=Trim(MaskEdit1.Text);
  DBGrid1.SelectedIndex :=7;
  DBGrid1.SelectedField.Text :=Trim(Edit6.Text);
  DBGrid1.SelectedIndex :=8;
  DBGrid1.SelectedField.Text :=Trim(Edit7.Text);
  DBGrid1.SelectedIndex :=9;
  DBGrid1.SelectedField.Text :=Trim(ComboBox1.Text);
  DBGrid1.SelectedIndex :=10;
  DBGrid1.SelectedField.Text :=Trim(MaskEdit2.Text);
  DBGrid1.SelectedIndex :=0;
  Table1.Post;
  Table1.FlushBuffers;
  End
  Else
  Begin
    ShowMessage('·ÿ›« ⁄‰Ê«‰ ò «» —« Ê«—œ ò‰Ìœ');
    Edit1.SetFocus;
  End;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
  Animate1.Visible :=True;
  Animate1.CommonAVI :=aviDeleteFile;
  Animate1.Play(1,24,0);
If Table1.RecordCount <> 0 Then
begin
  if MessageDlg('«Ì« „«Ì· »Â Õ–› ﬂ «» „Ê—œ‰Ÿ— „Ì »«‘Ìœø', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    Form2.Enabled :=False;
    If Table1.RecordCount>0 Then Table1.Delete;
    DBGrid1.SelectedIndex :=0;
    Repeat
      If Table1.RecordCount <> 0 Then
      Begin
        Table1.Edit;
        DBGrid1.SelectedField.Text :=IntToStr(Table1.RecNo);
      End;
    Until Table1.FindNext=False;
    MessageDlg('—œÌ› ê–«—Ì „Ãœœ° »« „Ê›ﬁÌ  «‰Ã«„ ‘œ', mtInformation, [mbOK], 0);
    Form2.Enabled :=True;
  end;
end
else MessageDlg('ﬂ «»Ì »Â „‰ŸÊ— Õ–› œ— ﬂ «»Œ«‰Â ÊÃÊœ ‰œ«—œ', mtError, [mbOK], 0);
  Animate1.Stop;
  Animate1.Visible :=False;;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  Table1.Last;
  Table1.Insert;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  MaskEdit1.Clear;
  Edit6.Clear;
  Edit7.Clear;
  ComboBox1.ClearSelection;
  MaskEdit2.Clear;
  Edit1.SetFocus;
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
  Table1.First;
end;

procedure TForm2.BitBtn9Click(Sender: TObject);
begin
  Table1.Last;
end;

procedure TForm2.BitBtn10Click(Sender: TObject);
begin
  Table1.Next;
end;

procedure TForm2.BitBtn11Click(Sender: TObject);
begin
  Table1.Prior;
end;

procedure TForm2.StringGrid1Click(Sender: TObject);
var id:string;
begin
  If (POS('»Ì ‰ ÌÃÂ', StringGrid1.Cells[0,StringGrid1.Selection.Top])=0) AND (Trim(StringGrid1.Cells[0,StringGrid1.Selection.Top])<>'') Then
  Begin
    id :=StringGrid1.Cells[0,StringGrid1.Selection.Top];
    Delete(id, POS('ò «» /',id),6);
    Delete(id, POS('„Ê·› /',id),6);
    Delete(id, POS('„Ê÷Ê⁄ /',id),7);
    Table1.RecNo :=StrToInt(Trim(id));
  End;
end;
end.
