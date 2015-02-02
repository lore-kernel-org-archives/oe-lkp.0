Content-Type: multipart/mixed; boundary="===============6309609302258606967=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: __might_sleep() warnings on v3.19-rc6
Date: Mon, 02 Feb 2015 15:58:43 +1100
Message-ID: <20150202155843.5991a10c@notabene.brown>
In-Reply-To: <20150202100338.4fa9eefa@notabene.brown>
List-Id: <oe-lkp.lists.linux.dev>

--===============6309609302258606967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


(high-jacking the thread a bit... I don't have the patch that I want to rep=
ly
to still in my mail box:  the subject still matches...)

I just got a might-sleep warning in my own testing.
This was introduced by =


commit e22b886a8a43b147e1994a9f970f678fc0df2033
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Wed Sep 24 10:18:48 2014 +0200

    sched/wait: Add might_sleep() checks


In particular:

@@ -318,6 +320,7 @@ do {                                                   =
     =

  */
 #define wait_event_cmd(wq, condition, cmd1, cmd2)                      \
 do {                                                                   \
+       might_sleep();                                                  \
        if (condition)                                                  \
                break;                                                  \
        __wait_event_cmd(wq, condition, cmd1, cmd2);                    \


Where I call this in raid5_quiesce(), 'cmd1' releases a lock and enables
interrupts and  cmd2 takes the lock and disables interrupts.

So it is perfectly OK to sleep at the point where schedule is called, but n=
ot
at the point where wait_event_cmd is called.

I can't use wait_event_lock_irq_cmd() as there are actually several spinloc=
ks
I need to manipulate.

So I'm hoping that this part of the patch (at least) can be reverted.

Otherwise I guess I'll need to use __wait_event_cmd().

Thanks,
NeilBrown

--===============6309609302258606967==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSVZBd1VC
Vk04RUF6bnNudDFXWW9HNUFRS1FYUS8vY0tieGRMRjBvanU1NGYrd0pwM0Jqb2NMd3hFVDl0RFMK
aU1UNHZxTWlXVFhuclZJd3JtcGFKdWc0ZkU0bVhqWDRIQm5IQWhjUlhUdlNmTDVHQmg1Q25jYUpX
TDdzL2c5VQpjcmU4NTZmVFFudGhjV1pWZFhKOXl4Rm43UDhvQXRQcjJVd0U4bkhOK2MxWWpOeTZo
THUvMndaUUpHczRxOTJiCnFVWGlXMG1qaEtZTzU0dEdhcTRQZVRld3hVQnFnem9qWC9ZemdtYzFU
NHg0c0lGMFlGWGcrU3ZPUUJ0K3ljejkKd3BJTk42QS9CSHI4ZlNwOWd5MW5LTnJwaXpOMGJuelpq
bldxWEhtcDFQeGVWRm5ZM1NCQTZiSmlXRTJVUXozSgpPR3NmWkdJSHB4WXl3dmtXVWVsSXQvdVNC
ZnN6WkNZRVFsNDludzkxMEVLY012b0kyc3FsbFJwZ25ZUWUyYVFCClFJS2trL1FqcnJlTFcwbVFH
L25RWXQ0Si8rOGdMbzQyc2RwWG5WWVc5V3g2QWhhSmtDUEtDa0RRQ2pDbHZsT3IKbnQ2djQzZGNY
UGdwRzBETXk1TTEvU1pCQklNMlBuci9GSFZlOUJocVk3ZkhGcndDVExzZ2hoSVhGVWd4QndqRApZ
S0wyRUR4R2FSNThXV0JOUkg4cDZydnlYZlRsVUlHRjRmOFNFZ3hrRFh1UldwblF1TWtjdVM0MFRx
bDdyOGdnCkJvdEQzaUp5RnU1YWNzQjFBQVdBMWdGZ2d3cFpFekdEM3p3Z2QwbnlrZHBEdVd2RXB1
aXZLclE4bTBNOTQ5KzYKdkwzL2J0dHg2dXFGN2M4ZmJtVkZmSWFKUlBvSmQvS0F6WVd1Q0RoT3ZT
NTNKQlJqcU9IdExCK0ZmdVJQUVFZawpQTXkyMGttc21DZz0KPW1yU0QKLS0tLS1FTkQgUEdQIFNJ
R05BVFVSRS0tLS0tCg==

--===============6309609302258606967==--

