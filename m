Content-Type: multipart/mixed; boundary="===============1053546878925568867=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.com>
To: lkp@lists.01.org
Subject: Re: [fs/locks] 83b381078b: will-it-scale.per_thread_ops -62.5% regression
Date: Wed, 28 Nov 2018 10:20:34 +1100
Message-ID: <87mupup0ot.fsf@notabene.neil.brown.name>
In-Reply-To: <20181127174315.GA29963@parsley.fieldses.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1053546878925568867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27 2018, J. Bruce Fields wrote:

> Thanks for the report!

Yes, thanks.  I thought I had replied to the previous report of a similar
problem, but I didn't actually send that email - oops.
Though the test is the same and the regression similar, this is a
different patch.  The previous report identified =

 fs/locks: allow a lock request to block other requests
this one identifies
  fs/locks: always delete_block after waiting.

Both cause blocked_lock_lock to be taken more often.

In one case is it due to locks_move_blocks().  That can probably be
optimised to skip the lock if list_empty(&fl->fl_blocked_requests).
I'd need to double-check, but I think that is safe to check without
locking.

This one causes locks_delete_blocks() to be called more often.  We now
call it even if no waiting happened at all.  I suspect we can test for
that and avoid it.  I'll have a look.

>
> On Tue, Nov 27, 2018 at 02:01:02PM +0800, kernel test robot wrote:
>> FYI, we noticed a -62.5% regression of will-it-scale.per_thread_ops due =
to commit:
>> =

>> =

>> commit: 83b381078b5ecab098ebf6bc9548bb32af1dbf31 ("fs/locks: always dele=
te_block after waiting.")
>> https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git locks-next
>> =

>> in testcase: will-it-scale
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>> with following parameters:
>> =

>> 	nr_task: 16
>> 	mode: thread
>> 	test: lock1
>
> So I guess it's doing this, uncontended file lock/unlock?:
>
> 	https://github.com/antonblanchard/will-it-scale/blob/master/tests/lock1.c
>
> Each thread is repeatedly locking and unlocking a file that is only used
> by that thread.

Thanks for identifying that Bruce.
This would certainly be a case where locks_delete_block() is now being
called when it wasn't before.


>
> By the way, what's the X-axis on these graphs?  (Or the y-axis, for that
> matter?)

A key would help.  I think the X-axis is number-of-threads.  y-axis
might be ops-per-second ??.

Thanks,
NeilBrown


>
> --b.
>
>>                             will-it-scale.per_thread_ops                =
        =

>>                                                                         =
        =

>>   450000 +-+------------------------------------------------------------=
----+   =

>>          |                                                              =
    |   =

>>   400000 +-+   +..+..  .+..+..  .+..+..+...+..+..+..   +..        .+..  =
  ..|   =

>>   350000 +-+ ..      +.       +.                     ..         +.    +.=
.+  |   =

>>          |  +                                       +     +     :       =
    |   =

>>   300000 +-+                                              :    :        =
    |   =

>>   250000 +-+                                               :   :        =
    |   =

>>          |                                                 :   :        =
    |   =

>>   200000 +-+                                               :   :        =
    |   =

>>   150000 +-+                                                : :         =
    |   =

>>          O  O  O  O  O  O  O  O  O  O  O   O  O  O  O  O  O :O: O  O  O =
 O  O   =

>>   100000 +-+                                                : :         =
    |   =

>>    50000 +-+                                                : :         =
    |   =

>>          |                                                   :          =
    |   =

>>        0 +-+------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                will-it-scale.workload                   =
        =

>>                                                                         =
        =

>>   7e+06 +-+-------------------------------------------------------------=
----+   =

>>         |              +...+..           .+..+..+     +            +..  =
    |   =

>>   6e+06 +-+   +..+.. ..         .+..+..+.        +   + +         ..     =
  ..|   =

>>         |   ..      +         +.                  + +   +       +     +.=
.+  |   =

>>   5e+06 +-++                                       +     +      :       =
    |   =

>>         |                                                :     :        =
    |   =

>>   4e+06 +-+                                               :    :        =
    |   =

>>         |                                                 :    :        =
    |   =

>>   3e+06 +-+                                                :   :        =
    |   =

>>         |                                       O     O    :  : O  O    =
    |   =

>>   2e+06 O-+O  O  O  O  O   O  O  O  O  O  O  O     O     O : O:       O =
 O  O   =

>>         |                                                   : :         =
    |   =

>>   1e+06 +-+                                                 : :         =
    |   =

>>         |                                                    :          =
    |   =

>>       0 +-+-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                            will-it-scale.time.user_time                 =
        =

>>                                                                         =
        =

>>   250 +-+---------------------------------------------------------------=
----+   =

>>       |                 .+..               .+..                   +..   =
    |   =

>>       |..   +...+..  .+.      .+...+..+..+.    +..    +..       ..   .  =
  ..|   =

>>   200 +-+ ..       +.       +.                    . ..         +      +.=
.+  |   =

>>       |  +                                         +     +     :        =
    |   =

>>       |                                                  :    :         =
    |   =

>>   150 +-+                                                 :   :         =
    |   =

>>       |                                                   :   :         =
    |   =

>>   100 +-+                                                 :   :         =
    |   =

>>       |  O      O                                          : :          =
    |   =

>>       O     O      O  O  O  O  O   O  O  O  O  O   O  O  O :O: O  O   O =
 O  O   =

>>    50 +-+                                                  : :          =
    |   =

>>       |                                                    : :          =
    |   =

>>       |                                                     :           =
    |   =

>>     0 +-+---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                           will-it-scale.time.system_time                =
        =

>>                                                                         =
        =

>>   5000 +-+--------------------------------------------------------------=
----+   =

>>   4500 O-+O..O..O...O..O..O..O..O..O..O...O..O..O..O..O..O  O  O...O..O.=
.O..O   =

>>        |                                                 :     :        =
    |   =

>>   4000 +-+                                               :     :        =
    |   =

>>   3500 +-+                                                :   :         =
    |   =

>>        |                                                  :   :         =
    |   =

>>   3000 +-+                                                :   :         =
    |   =

>>   2500 +-+                                                :   :         =
    |   =

>>   2000 +-+                                                 : :          =
    |   =

>>        |                                                   : :          =
    |   =

>>   1500 +-+                                                 : :          =
    |   =

>>   1000 +-+                                                 : :          =
    |   =

>>        |                                                    :           =
    |   =

>>    500 +-+                                                  :           =
    |   =

>>      0 +-+--------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
        =

>> [*] bisect-good sample
>> [O] bisect-bad  sample

--===============1053546878925568867==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWx2OTBVSUFDZ2tRT2V5ZTNWWmkKZ2JuUWl3Ly9kbFpRVHRvb2xW
cXRmRFRlU3RhdVgzSS8rekpHUEZqQmQ4MGFoYTM5ZWVGaHJEclluUEswRkVYQQpIaWh4eE9NV0Zm
RGJHY2NYWG1lREtjdUd1NCtUWmJmWHF1R09Wd0tGejljRjlPS2JVYlFqLzZ2ZGs3TU1CdEVLCnE3
L1NCSitDdkVpdHRjT1hhQzVHV2JzelRuTzlQSDAxLzllYklrTk9PeW8vTHgwbEFMcW1nbUdDUlVU
TG1veVMKL3BIcXNWVUxva3FmQnljcFk0cXZFdUg4dnNmTkh4RVlBbTRuSEVrRGZCemF3c05XR1hX
R3djL3dzZHl6ZC9RRApGTElBOU05YXFxNmdyekpFLzRGVGh1ODlrQ2Uxak5pVmNlL20zRkxvOU1q
dksyeG5xRlE4WTdhdXNsTXB6ejlVCm04MjdrK0VoUU9GMWVya3o5TENPZUlUNExQT1RVeEYvSndp
YXpFV3RzNFVsbkIzeWFjUG5uamkyWlNlK3FpMnIKMTErTlJDelFMUEx5bTNyRXJveDBCS0JEWUlm
RkN5QVNNTTh4WS9EVFlBdC94MUlWd2Fsb0ltaHlIVFJUQ3JUTwo4RnFjWGJVOFEwSFRDbUp4Vm9l
OTgvSVJJZFFnRFptL3U2VnhBbUxVNVA2bXE3OE50VkJSTXRTaTJNdDFScVhCCldIeXY0bW1maVpV
Q2JuakZrMSt3TmJxTDJYUW5kQkdyay9SMjlQQUVGN3pBN3h2YWJ2RmlUbVVUeUgzU0Z0REIKNXhV
aVpDUmJiSFBQRE9nVUM3TlV6Sm1WYUhDdVllUktpVlhMNXJ1cVhrTnZ5RmpjZ0xVcXdEV20yUXdJ
YzRleApJUFgzZUkzc1I1SUtJUmd2R2tQaUo3eC9HSm9wNUJ0eFJUdUE2aGFMSHFYQnRGTC9waDg9
Cj1qZi8vCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============1053546878925568867==--

