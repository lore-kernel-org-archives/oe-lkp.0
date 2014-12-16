Content-Type: multipart/mixed; boundary="===============6832846584557751926=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [userns] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 16 Dec 2014 09:47:39 +0800
Message-ID: <1418694459.5745.198.camel@intel.com>
In-Reply-To: <87iohcx1k1.fsf@x220.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6832846584557751926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-12-15 at 11:31 -0600, Eric W. Biederman wrote:
> Huang Ying <ying.huang@intel.com> writes:
> =

> > FYI, we noticed the below changes on
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it for-testing
> > commit bbea5f5532501fdd67f46442ba7b1122d7ff3123 =

> > ("userns: Add a knob to disable setgroups on a per user namespace basis=
")
> =

> Thank you.
> =

> I am quite puzzled by this failure.  There was an similar failure when
> /proc/[pid]/setgroups was read (if I recall correctly).  I don't see how
> that change could result at failures during open or failures during
> boot.  I added a new file to proc which any reasonable system should
> leave alone.  Are you by chance running trinity during boot?

Yes.  We are running trinity during boot.

> If the reproducer gave me any clue about which file that was opened or
> which code path this happened on I would be bery interested.  If for no
> other reason that to confirm that I have fixed the issue.

This is just boot test, with trinity running after kernel boot.

Fengguang, do you have more information?

Best Regards,
Huang, Ying

> I have rewritten the implementation of /proc/[pid]/setgroups so it is
> simpler and more robust and does not have any errors I can detect.
> =

> Thank you very much for picking up my for-testing branch and beating up
> on it.
> =

> Eric



--===============6832846584557751926==--

