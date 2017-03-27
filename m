Content-Type: multipart/mixed; boundary="===============5148771023219174367=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fsnotify] 0ee0efcf7c: kernel_BUG_at_fs/notify/inotify/inotify_user.c
Date: Mon, 27 Mar 2017 16:48:52 +0200
Message-ID: <20170327144852.GG6071@quack2.suse.cz>
In-Reply-To: <20170327043617.GC17604@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5148771023219174367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 27-03-17 12:36:17, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 0ee0efcf7c7968fb045454f621b5681e94b2c288 ("fsnotify: Move queuein=
g of mark for destruction into fsnotify_put_mark()")
> https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git for_testing
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/

Yeah, the commit forgot to update assertion in inotify as ONESHOT watches
will now see one-less refcount (the protection still works right since they
are protected by SRCU in that case). Fixed.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============5148771023219174367==--

