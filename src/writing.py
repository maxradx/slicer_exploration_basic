# This script works only in 3DSlicer python console.

################# CONFIG FILE BEGIN ##########################

# Specify the absolute path where you want to write the file
output_folder = "/Users/maximebouthillier/gitmax/code/myrepos/slicer_exploration_basic"

# Specify the absolute path of the script you want to execute
script_file = "/Users/maximebouthillier/gitmax/code/myrepos/slicer_exploration_basic/src/script_file_to_execute.py"  #ex print 1212

################# CONFIG FILE END ##########################

import os
import subprocess
import slicer
import qt
import ctk

def write_results_from_script() :

    # Ensure that the output folder exists, create it if it doesn't
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Specify the output file name and path within the output folder
    output_file = os.path.join(output_folder, "output_file.txt")

    # Make connection between output folder and the script (comment to revise)
    file_to_execute = os.path.join(output_folder, script_file)
    command = ["python3", file_to_execute]

    # Open the file in write mode and write some content
    with open(output_file, "w") as f:
        subprocess.run(command, stdout=f)
        # f.write("Hello, world!\n")

    print("File has been written to:", output_file)

# Button creation (could be class)
# Create a ctkCollapsibleGroupBox instance
collapsibleGroupBox = ctk.ctkCollapsibleGroupBox()
collapsibleGroupBox.setTitle("My Collapsible Group Box")

# Create a layout for the collapsible group box
layout = qt.QVBoxLayout(collapsibleGroupBox)

# Create a QPushButton instance
button = qt.QPushButton("Click me")

button.setFixedSize(125, 40)  # Set width to 100 pixels and height to 30 pixels

# Add the button to the layout
layout.addWidget(button)

# Set the layout of the collapsible group box
collapsibleGroupBox.setLayout(layout)

# Add the collapsible group box to the main window layout of 3D Slicer
slicer.util.mainWindow().layout().addWidget(collapsibleGroupBox)

# Define a function to handle button clicks
def on_button_clicked():
    write_results_from_script()
    print("Button clicked!")


# Connect the button's clicked signal to the function
button.connect('clicked()', on_button_clicked)