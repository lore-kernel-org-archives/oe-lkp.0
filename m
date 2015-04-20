Content-Type: multipart/mixed; boundary="===============2087708603545382577=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ocfs2] e2ac55b6a8e: ocfs2_init:1612 ERROR: Unable to create ocfs2 debugfs root
Date: Mon, 20 Apr 2015 13:50:38 -0700
Message-ID: <CA+55aFy7_RXZ-B=3kqtpkRTT8e1i0D9TC-FHDx5v+w1ija1=Tw@mail.gmail.com>
In-Reply-To: <465C1C8A-0819-4253-9525-6168CCCA133A@gatech.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============2087708603545382577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2015 at 8:45 PM, Chengyu Song <csong84@gatech.edu> wrote:
>
> As suggested in the patch,  -19 (-ENODEV) happens when debugfs is not con=
figured (see include/linux/debugfs.h). So if debugfs is necessary for the f=
unctionality, in Kconfig, we should either declare it as a dependency, or a=
uto select it.

That makes no sense.

If it used to work before that patch, then this is a regression and
the patch needs to be reverted.

Yes, the old code apparently used to set "o2hb_debug_dir" to an error
pointer when debugfs was compiled out, but since debugfs was compiled
out, that error pointer was probably never actually *used*. So things
presumably worked.

Now, it hangs, according to Huang Ying. If so, that's clearly a
regression. That means that commit e2ac55b6a8e3 ("ocfs2: incorrect
check for debugfs returns") needs to be reverted or fixed.

Andrew?

                      Linus

--===============2087708603545382577==--

