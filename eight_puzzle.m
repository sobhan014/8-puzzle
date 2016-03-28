function [] = eight_puzzle ()
    image = imread('9.png');
    %image = rgb2gray(image);
    table = zeros(3,3);
    table(1,1) = 1;
    table(1,2) = 2;
    table(1,3) = 3;
    table(2,1) = 4;
    table(2,2) = 5;
    table(2,3) = 6;
    table(3,1) = 7;
    table(3,2) = 8;
    table(3,3) = 0;
    target = table;
    x =3;
    y =3;
    for i= 1:100
        a = rand(1,1)*4;
        a = a - rem(a,1);
        if a==0
            if x > 1
                table (x,y)=table (x-1,y);
                table (x-1,y)=0;
                temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                image((x-1)*200+1:x*200,(y-1)*200+1:y*200,:)=image((x-2)*200+1: (x-1)*200,(y-1)*200+1:y*200,:);
                image((x-2)*200+1: (x-1)*200,(y-1)*200+1:y*200,:)=temp;
                x=x-1;
            end
        else if a==1
                 if x < 3
                     table (x,y)=table (x+1,y);
                     table (x+1,y)=0;
                     temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                     image((x-1)*200+1:x*200,(y-1)*200+1:y*200,:)=image(x*200+1: (x+1)*200,(y-1)*200+1:y*200,:);
                     image(x*200+1: (x+1)*200,(y-1)*200+1:y*200,:)=temp;
                     x=x+1;
                 end
            else if a==2
                    if y < 3
                        table(x,y)=table(x,y+1);
                        table(x,y+1)=0;
                        temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                        image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:)=image ((x-1)*200+1: x*200,y*200+1:(y+1)*200,:);
                        image ((x-1)*200+1: x*200,y*200+1:(y+1)*200,:)=temp;
                        y=y+1;
                    end
                else % a==3
                     if y > 1
                        table(x,y)=table(x,y-1);
                        table(x,y-1)=0;
                        temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                        image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:)=image ((x-1)*200+1: x*200,(y-2)*200+1:(y-1)*200,:);
                        image ((x-1)*200+1: x*200,(y-2)*200+1:(y-1)*200,:)=temp;
                        y=y-1;
                    end
                end
            end
        end
    end
    imshow(image);clc;
    while true
        if table == target
            break;
        end
        A = ginput(1);
        x2 = A(1,2);
        y2 = A(1,1);
        x2 = x2-rem(x2,1);y2 = y2-rem(y2,1);
        x = (x2/200)-rem(x2/200,1)+1;
        y = (y2/200)-rem(y2/200,1)+1;
        if x>1
            if table(x-1,y)==0
                table(x-1,y)=table(x,y);
                table(x,y)=0;
                temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                image((x-1)*200+1:x*200,(y-1)*200+1:y*200,:)=image((x-2)*200+1: (x-1)*200,(y-1)*200+1:y*200,:);
                image((x-2)*200+1: (x-1)*200,(y-1)*200+1:y*200,:)=temp;
                %x=x-1;
            end
        end
        if x<3
            if table(x+1,y)==0
                table(x+1,y)=table(x,y);
                table(x,y)=0;
                temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                image((x-1)*200+1:x*200,(y-1)*200+1:y*200,:)=image(x*200+1: (x+1)*200,(y-1)*200+1:y*200,:);
                image(x*200+1: (x+1)*200,(y-1)*200+1:y*200,:)=temp;
                %x=x+1;
            end
        end
        if y<3
            if table(x,y+1)==0
               table(x,y+1)=table(x,y);
               table(x,y)=0;
               temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
               image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:)=image ((x-1)*200+1: x*200,y*200+1:(y+1)*200,:);
               image ((x-1)*200+1: x*200,y*200+1:(y+1)*200,:)=temp;
               %y=y+1;    
            end
        end
        if y>1
            if table(x,y-1)==0
                table(x,y-1)=table(x,y);
                table(x,y)=0;
                temp = image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:);
                image ((x-1)*200+1: x*200,(y-1)*200+1:y*200,:)=image ((x-1)*200+1: x*200,(y-2)*200+1:(y-1)*200,:);
                image ((x-1)*200+1: x*200,(y-2)*200+1:(y-1)*200,:)=temp;
                %y=y-1;
            end
        end
        imshow(image);clc;
    end
    imshow(255-image);clc;
end