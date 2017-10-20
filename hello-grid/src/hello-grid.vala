/*
 * Copyright (c) 2011-2017 Danger Cove (https://www.dangercove.com)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Boy van Amstel <boy@dangercove.com>
 */

int main (string[] args) {
  Gtk.init (ref args);

  var window = new Gtk.Window ();
  window.title = "Elementary Grids";
  window.set_border_width (12);
  window.set_position (Gtk.WindowPosition.CENTER);
  window.set_default_size (350, 70);
  window.destroy.connect (Gtk.main_quit);

  var grid = new Gtk.Grid ();
  grid.orientation = Gtk.Orientation.VERTICAL;
  grid.row_spacing = 6;

  var button = new Gtk.Button.with_label ("Click me!");
  var label = new Gtk.Label (null);

  button.clicked.connect (() => {
      label.label = _("Hello World!");
      button.sensitive = false;
  });

  grid.add (button);
  grid.add (label);

  window.add (grid);
  window.show_all ();

  Gtk.main ();
  return 0;
}
