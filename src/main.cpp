#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Button.H>
#include <cstdlib>
#include <iostream>
#include <string>

using namespace std;

//https://github.com/tinycorelinux/fltk_projects/blob/master/cpanel/cpanel.cxx
void btn_callback(Fl_Widget* w, void* userdata) {
  system((const char*)userdata);
} 

int main(int argc, char **argv) {
    int win_w=140;
    int win_h=600;

    int btn_x=10;
    int btn_y=10;
    int btn_w=win_w-2*btn_x;
    int btn_h=50;

    int results=0;

    Fl_Window *window = new Fl_Window(win_w,win_h,"tcScriptLauncher");
    //align from the top-------------------------------------------------------------------
    //button1
    Fl_Button *button1 = new Fl_Button(btn_x,btn_y,btn_w,btn_h,"USB\nCAMERA");
    button1->callback((Fl_Callback*)btn_callback, (void*)("/mnt/sda1/scripts/mplayer_camera.sh &"));
    //button2
    Fl_Button *button2 = new Fl_Button(btn_x,2*btn_y+1*btn_h,btn_w,btn_h,"IP\nCAMERA");
    button2->callback((Fl_Callback*)btn_callback, (void*)("/mnt/sda1/scripts/mplayer_ipcamera.sh &"));
    
    //align from the bottom-----------------------------------------------------------------
    //move windows
    Fl_Button *button_move = new Fl_Button(btn_x,win_h-2*btn_y-2*btn_h,btn_w,btn_h,"MOVE\nAPPS");
    button_move->callback((Fl_Callback*)btn_callback, (void*)("/mnt/sda1/scripts/move_window.sh &"));
    //button exit
    Fl_Button *button_exit = new Fl_Button(btn_x,win_h-btn_y-btn_h,btn_w,btn_h,"EXIT\nAPPS");
    button_exit->callback((Fl_Callback*)btn_callback, (void*)("/mnt/sda1/scripts/close_apps.sh &"));
    window->end();

    /*
    results=system("ps -e | grep mplayer | awk 'END{print NR}'");
    if(results > 1){
        system("/mnt/sda1/scripts/move_window.sh");
    }*/

    window->show(argc, argv);
    return Fl::run();
}
