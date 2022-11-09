unit _2018068;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ListBox2: TListBox;
    Button2: TButton;
    Label11: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Data : array of integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var a, r, Head, Tail, TAngka : integer;
begin
   ListBox1.Items.Clear;
   Head := strtoint(Edit1.Text);
   Tail := strtoint(Edit2.Text);
   TAngka := strtoint(Edit3.Text);
   for a := 0 to (TAngka-1) do
   begin
       randomize;
       r := Random(Tail-Head)+Head;
       ListBox1.Items.Add(inttostr(r));
   end;
end;

procedure QuickSort(var Data: array of Integer; L, R: Integer) ; //Membuat QuickSort
var a, b, mid, T: Integer;
begin
    a := L;
    b := R;
    mid := Data[(L + R) div 2];
    repeat
        while (Data[a] < mid) do inc (a); //selama nilai Data[a] lebih kecil daripada nilai Mid maka a bertambah 1
        while (Data[b] > mid) do Dec(b) ; //selama nilai Data[b] lebih besar daripada nilai Mid makan b berkurang 1
        if a <= b then //jika a <= b maka data ditukar
        begin
            T := Data[b];
            Data[b] := Data[a];
            Data[a] := T;
            Inc(a) ;
            Dec(b) ;
        end;
    until a > b;
    if b > L then QuickSort(Data, L, b) ;
    if a < R then QuickSort(Data, a, R) ;
end;

procedure TForm1.Button2Click(Sender: TObject);
var index : word;
begin

    SetLength(Data,ListBox1.Items.Count) ;// Memenuhi Data untuk di sorting ke ListBox2
    for index := 0 to ListBox1.Items.Count - 1 do // Memasuki Data Angka ke array
    Data[index] := StrToInt(ListBox1.Items[index]);
    QuickSort(data,Low(Data),High(Data)); // Proses pengurutan / sorting
    listbox2.Items.clear; // Memasukkan nilai hasil
    for index := 0 to ListBox1.Items.Count - 1 do
    ListBox2.Items.Add(IntToStr(data[index]));

end;

end.
