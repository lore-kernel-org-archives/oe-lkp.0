Content-Type: multipart/mixed; boundary="===============2071062554909651860=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [userns] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Mon, 15 Dec 2014 11:31:10 -0600
Message-ID: <87iohcx1k1.fsf@x220.int.ebiederm.org>
In-Reply-To: <1418613661.5745.164.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2071062554909651860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Huang Ying <ying.huang@intel.com> writes:

> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git=
 for-testing
> commit bbea5f5532501fdd67f46442ba7b1122d7ff3123 =

> ("userns: Add a knob to disable setgroups on a per user namespace basis")

Thank you.

I am quite puzzled by this failure.  There was an similar failure when
/proc/[pid]/setgroups was read (if I recall correctly).  I don't see how
that change could result at failures during open or failures during
boot.  I added a new file to proc which any reasonable system should
leave alone.  Are you by chance running trinity during boot?

If the reproducer gave me any clue about which file that was opened or
which code path this happened on I would be bery interested.  If for no
other reason that to confirm that I have fixed the issue.

I have rewritten the implementation of /proc/[pid]/setgroups so it is
simpler and more robust and does not have any errors I can detect.

Thank you very much for picking up my for-testing branch and beating up
on it.

Eric

--===============2071062554909651860==--

