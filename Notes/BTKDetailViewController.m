//
//  BTKDetailViewController.m
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import "BTKDetailViewController.h"
#import "BTKNote.h"

@interface BTKDetailViewController ()
- (void)configureView;
@end

@implementation BTKDetailViewController

@synthesize note = _note;

#pragma mark - Managing the detail item

/*
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
*/

- (void)setNote:(BTKNote *) newNote {
    if (_note != newNote) {
        _note = newNote;
        
        //update the view
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    BTKNote *theNote = self.note;
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if(theNote) {
        self.noteTitleField.text = theNote.title;
        self.noteLocationField.text = theNote.location;
        self.noteDateField.text = [formatter stringFromDate:(NSDate *)theNote.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    self.note = nil;
    [self setNoteTitleField:nil];
    [self setNoteLocationField:nil];
    [self setNoteDateField:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editedNote:(id)sender {
    self.note.title = self.noteTitleField.text;
    self.note.location = self.noteLocationField.text;
    
    /*
    [[self delegate] BTKDetailViewControllerDidFinish:self title:self.noteTitleField.text location:self.noteLocationField.text];
     */
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
