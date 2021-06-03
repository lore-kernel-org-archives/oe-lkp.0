Content-Type: multipart/mixed; boundary="===============5133111981237565205=="
MIME-Version: 1.0
From: Amir Goldstein <amir73il@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fanotify] a8b98c808e: stress-ng.fanotify.ops_per_sec 32.2% improvement
Date: Thu, 03 Jun 2021 09:57:15 +0300
Message-ID: <CAOQ4uxjdtfriARxh_CiTxFi8=T6j065HtbJGnuAas7oyPNADKg@mail.gmail.com>
In-Reply-To: <20210603015314.GA21290@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5133111981237565205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 3, 2021 at 4:36 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed a 32.2% improvement of stress-ng.fanotify.ops_per_sec due=
 to commit:
>
>
> commit: a8b98c808eab3ec8f1b5a64be967b0f4af4cae43 ("fanotify: fix permissi=
on model of unprivileged group")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>

I guess now we know what caused the reported regression:
https://lore.kernel.org/lkml/20210511124632.GL24154(a)quack2.suse.cz/

I didn't know that capable() is so significant.

FWIW, here is a link to the test code:
https://github.com/ColinIanKing/stress-ng/blob/master/stress-fanotify.c#L474

It creates events in a loop by child process while the parent process
reads the generated events in a loop (on two different fanotify groups).

Thanks,
Amir.
--===============5133111981237565205==--

