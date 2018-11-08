Content-Type: multipart/mixed; boundary="===============0828704814298551049=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d50d82faa0 [ 33.671845] WARNING: possible circular locking dependency detected
Date: Wed, 07 Nov 2018 19:05:58 -0800
Message-ID: <20181107190558.812375161de4b5df413ea31b@linux-foundation.org>
In-Reply-To: <20181107154336.21e1f815226facdffd4a6c54@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0828704814298551049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Nov 2018 15:43:36 -0800 Andrew Morton <akpm@linux-foundation.or=
g> wrote:

> On Tue, 23 Oct 2018 08:30:04 +0800 kernel test robot <rong.a.chen@intel=
.com> wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > commit d50d82faa0c964e31f7a946ba8aba7c715ca7ab0
> > Author:     Mikulas Patocka <mpatocka@redhat.com>
> > AuthorDate: Wed Jun 27 23:26:09 2018 -0700
> > Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> > CommitDate: Thu Jun 28 11:16:44 2018 -0700
> > =

> >     slub: fix failure when we delete and create a slab cache
> =

> This is ugly.  Is there an alternative way of fixing the race which
> Mikulas attempted to address?  Possibly cancel the work and reuse the
> existing sysfs file, or is that too stupid to live?
> =

> 3b7b314053d021 ("slub: make sysfs file removal asynchronous") was
> pretty lame, really.  As mentioned,
> =

> : It'd be the cleanest to deal with the issue by removing sysfs files
> : without holding slab_mutex before the rest of shutdown; however, given
> : the current code structure, it is pretty difficult to do so.
> =

> Would be a preferable approach.
> =

> >     =

> >     This uncovered a bug in the slub subsystem - if we delete a cache a=
nd
> >     immediatelly create another cache with the same attributes, it fails
> >     because of duplicate filename in /sys/kernel/slab/.  The slub subsy=
stem
> >     offloads freeing the cache to a workqueue - and if we create the new
> >     cache before the workqueue runs, it complains because of duplicate
> >     filename in sysfs.

Alternatively, could we flush the workqueue before attempting to
(re)create the sysfs file?  Extra points for only doing this if the
first (re)creation attempt returned -EEXIST?


--===============0828704814298551049==--

