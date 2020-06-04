Content-Type: multipart/mixed; boundary="===============6204291835065723654=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [exec] 166d03c9ec: ltp.execveat02.fail
Date: Thu, 04 Jun 2020 15:45:46 -0700
Message-ID: <202006041542.0720CB7A@keescook>
In-Reply-To: <20200525091420.GI12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6204291835065723654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 05:14:20PM +0800, kernel test robot wrote:
> Greeting,

(Whoops, I missed this in my inbox.)

> <<<test_start>>>
> tag=3Dexecveat02 stime=3D1590373229
> cmdline=3D"execveat02"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> execveat02.c:64: PASS: execveat() fails as expected: EBADF (9)
> execveat02.c:64: PASS: execveat() fails as expected: EINVAL (22)
> execveat02.c:61: FAIL: execveat() fails unexpectedly, expected: ELOOP: EA=
CCES (13)
> execveat02.c:64: PASS: execveat() fails as expected: ENOTDIR (20)

I will go check on this. Looking at the expected result (ELOOP) I think
this just means the test needs adjustment because it's trying to
double-check for a pathological case, but it seems their test setup
trips the (now earlier) IS_SREG() test. But I'll double-check and report
back!

-- =

Kees Cook
--===============6204291835065723654==--

