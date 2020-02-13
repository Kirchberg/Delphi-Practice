unit Figure;

interface
Uses graphics,ExtCtrls;

  Type
    TFigure=Class
      private
      x,y,halflen,
      dx,dy:integer;
      Image:TImage;
      procedure Draw;virtual;abstract;
      procedure Rel(t:real);virtual;
      public
      constructor Create(ax,ay,ah:integer;aImage:TImage);
      procedure Move(t:single);
  end;
  TAstroida=Class(TFigure)
    private procedure Draw;override;
  end;
  TCircle=Class(TFigure)
    private r:integer;
    procedure Draw;override;
    public constructor Create(ax,ay,ah,ar:integer;aImage:TImage);
  end;

Implementation

Constructor TFigure.Create;
Begin
  inherited Create;
  x:=ax; y:=ay; halflen:=ah; Image:=aImage;
End;

Procedure TFigure.Rel;
Begin
  dx:=round(halflen*cos(t));
  dy:=round(halflen*sin(t));
End;

Procedure TFigure.Move;
Begin
  Image.Canvas.Pen.Color:=clWhite;
  Draw;
  Image.Canvas.Pen.Color:=clBlack;
  Rel(t);
  Draw;
End;

Procedure TAstroida.Draw;
Begin
  Image.Canvas.Arc(x+dx,y+dy,x+70+dx,y+70+dy,x+40+dx,y,x,y+40+dy);
  Image.Canvas.Arc(x+dx-70,y+dy,x+70+dx-70,y+70+dy,x+dx,y+40+dy,x+40+dx-70,y);
  Image.Canvas.Arc(x+dx-70,y+dy-70,x+dx,y+dy,x+40+dx-80,y+dy,x+dx,y+40+dy-80);
  Image.Canvas.Arc(x+dx,y+dy-70,x+70+dx,y+dy,x,y+40+dy-70,x+40+dx,y+dy);
End;

Constructor TCircle.Create;
Begin
  inherited Create(ax,ay,ah,aImage);
r:=ar;
End;

Procedure TCircle.Draw;
Begin
  Image.Canvas.Ellipse(x+dx+r,y+dy+r,x+dx-r,y+dy-r);
End;

end.
