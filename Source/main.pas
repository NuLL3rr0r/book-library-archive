unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ShockwaveFlashObjects_TLB, Menus, ShellApi, XPMan;

Const WM_NOTIFYICON = WM_USER+333;

type
  TForm1 = class(TForm)
    ShockwaveFlash1: TShockwaveFlash;
    PopupMenu1: TPopupMenu;
    Restore1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure ShockwaveFlash1FSCommand(ASender: TObject; const command,
      args: WideString);
    procedure Exit1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    procedure CMClickIcon(var msg: TMessage);message WM_NOTIFYICON;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Tnid: TnotifyIconData;
  Icon: TIcon;
  lSave,tSave: Integer;

implementation

uses subdb;

{$R *.dfm}

procedure TForm1.CMClickIcon(var msg:TMessage);
var
  pt:TPoint;
begin
  GetCursorPos(pt);
  case msg.LParam of
    WM_LBUTTONDBLCLK:
      Begin
        Form1.Left :=lSave;
        Form1.Top :=tSave;
        Shell_NotifyIcon(NIM_DELETE, @Tnid);
      End;
    WM_RBUTTONUP: PopupMenu1.Popup (pt.X,pt.Y);
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var CurDir:array[0..255] of char;
begin
     GetCurrentDirectory(2255,CurDir);
     ShockwaveFlash1.Movie:=CurDir+'\gui.swf';
end;

procedure TForm1.ShockwaveFlash1FSCommand(ASender: TObject; const command,
  args: WideString);
begin
  If Command='quit' Then Halt;
  If Command='library' Then
    Begin
      Form2.Show;
      Form1.Hide;
    End;
  If Command='systemtray' Then
    Begin
      Icon:=TIcon.Create;
      Icon.Assign(application.Icon);
      Shell_NotifyIcon(NIM_DELETE, @Tnid);
      tnid.cbSize :=SizeOf(TNotifyIconData);
      tnid.Wnd :=Form1.Handle;
      tnid.uID :=1;tnid.uFlags :=NIF_MESSAGE or NIF_ICON or NIF_TIP;
      tnid.uCallbackMessage :=WM_NOTIFYICON;
      tnid.hIcon :=Icon.Handle;
      tnid.szTip :='ò·Ìò —«” : „‰ÊÌ »—‰«„Â / œ«»· ò·Ìò: »«“ ê‘  »Â »—‰«„Â';
      Shell_NotifyIcon(NIM_ADD, @Tnid);
      ShowWindow(application.Handle,SW_HIDE);
      Form1.Left :=Form1.Left +20000;
      Form1.Top :=Form1.Top +20000;
    End;
  If Command='backup' Then MessageDlg('«Ì‰ ﬁ”„  œ— Õ«· Õ«÷— ﬁ«»· «Ã—« ‰„Ì »«‘œ', mtInformation, [mbOK], 0);
  If Command='system' Then MessageDlg('«Ì‰ ﬁ”„  œ— Õ«· Õ«÷— ﬁ«»· «Ã—« ‰„Ì »«‘œ', mtInformation, [mbOK], 0);
  If Command='common' Then MessageDlg('«Ì‰ ﬁ”„  œ— Õ«· Õ«÷— ﬁ«»· «Ã—« ‰„Ì »«‘œ', mtInformation, [mbOK], 0);
  If Command='password' Then MessageDlg('«Ì‰ ﬁ”„  œ— Õ«· Õ«÷— ﬁ«»· «Ã—« ‰„Ì »«‘œ', mtInformation, [mbOK], 0);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
        Shell_NotifyIcon(NIM_DELETE, @Tnid);
        Halt;
end;

procedure TForm1.Restore1Click(Sender: TObject);
begin
        Form1.Left :=lSave;
        Form1.Top :=tSave;
        Shell_NotifyIcon(NIM_DELETE, @Tnid);
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg('«Ì‰ ﬁ”„  œ— Õ«· Õ«÷— ﬁ«»· «Ã—« ‰„Ì »«‘œ', mtInformation, [mbOK], 0)
end;

end.
