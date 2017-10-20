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

  var layout = new Gtk.Grid ();
  layout.column_spacing = 6;
  layout.row_spacing = 6;

  var hello_button = new Gtk.Button.with_label (_("Say Hello"));
  var hello_label = new Gtk.Label (null);

  var rotate_button = new Gtk.Button.with_label (_("Rotate"));
  var rotate_label = new Gtk.Label (_("Horizontal"));

  layout.attach (hello_button, 0, 0, 1, 1);
  layout.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);

  layout.attach (rotate_button, 0, 1, 1, 1);
  layout.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

  hello_button.clicked.connect (() => {
      hello_label.label = _("Hello World!");
      hello_button.sensitive = false;
  });

  rotate_button.clicked.connect (() => {
      rotate_label.angle = 90;
      rotate_label.label = _("Vertical");
      rotate_button.sensitive = false;
  });

  window.add (layout);
  window.show_all ();

  Gtk.main ();
  return 0;
}
