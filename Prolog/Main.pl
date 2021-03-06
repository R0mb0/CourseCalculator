/***** Main & Main Util Module. *****/

/*Verify If the Two Detections inserted Are Different.
* Input: Two Lists.
* Output An Error If the Two Detections Inserted Aren't Different.*/
verify_detections(List1, List2, Return_bool) :-
    (List1 == List2 -> 
        throw(error(inserted_the_same_detection_twice, verify_detections/2))
    ; 
        Return_bool = true
    ).

/*Main.*/
main :-
    consult('ListTools.pl'),
    consult('Detection.pl'),
    consult('Properties.pl'),
    write('Detections Properties Calculator V1.0'), nl,
    write('Warning: The Detections must be in D.M.G format and inserted into the program like: `N 40 45 36.000 - E 073 59 02.400`.'), nl,
    write('Insert the First Detection...'), nl,
    read(A),
    atom_chars(A, Det1),
    write('Insert the Second Detection...'), nl,
    read(B),
    atom_chars(B, Det2),
    write('Proceed [yes./no.]?'), nl,
    read(C),
    (C == 'yes' ->
        verify_detections(Det1, Det2, _),
        write('First Detection in Decimal Format ---> '),
        get_point(Det1, P1),
        index(0, P1, Dlat1),
        index(1, P1, Dlong1),
        format('~3f', [Dlat1]), write(','), format('~3f', [Dlong1]), nl,
        write('Second Detection in Decimal Format ---> '),
        get_point(Det2, P2),
        index(0, P2, Dlat2),
        index(1, P2, Dlong2),
        format('~3f', [Dlat2]), write(','), format('~3f', [Dlong2]), nl,
        write('Distance between First & Second Detections ---> '),
        distance(P1, P2, Distance),
        format('~2f', [Distance]), write('Km'), nl,
        write('Positive direction between First & Second Detections ---> '),
        direction(P1, P2, Direction),
        format('~2f', [Direction]), write('°'), nl,
        write('Negative direction between First & Second Detections ---> '),
        inverse_direction(P1, P2, InverseDir),
        format('~2f', [InverseDir]), write('°')
    ;
        write('Aborted...')
    ).
/***** End Module. *****/