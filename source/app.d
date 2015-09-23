import gtk.Builder;
import gtk.Main;
import gtk.MenuItem;
import gtk.Window;
import gtk.Widget;
import gtk.FileChooserDialog;

Builder builder;
Window window;

void main(string[] args)
{
    Main.init(args);

    builder = new Builder();
    builder.addFromFile(`source\nintemulator\ui\main-form.glade`);
    builder.addCallbackSymbol("fileOpen", &fileOpen);
    builder.addCallbackSymbol("fileExit", &fileExit);
    builder.connectSignals(null);

    window = cast(Window)builder.getObject("window");
	window.addOnHide( delegate void(Widget aux){ Main.quit(); } );
    window.showAll();

    Main.run();
}

extern(C) void fileOpen() {
}

extern(C) void fileExit() {
}
