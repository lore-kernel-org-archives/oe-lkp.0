Content-Type: multipart/mixed; boundary="===============2092658984745580295=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/nmi/64] 700926a9a1: Kernel BUG at ffffffff818dbf57 [verbose debug info unavailable]
Date: Sun, 28 Feb 2016 20:09:47 -0800
Message-ID: <CALCETrUXpJd30+TqL-Ecx8c4E8dkNVxPQagRLQ2G7OYJJuRC=g@mail.gmail.com>
In-Reply-To: <87k2lo48zs.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2092658984745580295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2016 at 5:10 PM, kernel test robot
<ying.huang@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
> commit 700926a9a1fd6f23a4f9ce5c781ea5123268d164 ("x86/nmi/64: Giant debug=
ging hack")
>
> Because of the patch subject, this report is just for your information
> and not send to list.

:)

I fixed my debugging hack now.  You compiled it using a configuration
I didn't anticipate.

--Andy

--===============2092658984745580295==--

