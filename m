Content-Type: multipart/mixed; boundary="===============2928306593661448032=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: d1b40ae9ca [ 18.779992] BUG: unable to handle kernel paging request at c0351cd8
Date: Mon, 06 Aug 2018 11:46:27 -0500
Message-ID: <8736vrcujg.fsf@xmission.com>
In-Reply-To: <20180806011423.GC18936@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2928306593661448032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it siginfo-testing

I finally think I see what is going on.  fork_idle being confusing
things with it's specialness.

I have updated my branch once again to handle this case.  If you could
place the branch above back into testing and let me know how it goes I
would appreciate it.

Thank you,
Eric Biederman

--===============2928306593661448032==--

