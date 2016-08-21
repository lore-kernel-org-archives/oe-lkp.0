Content-Type: multipart/mixed; boundary="===============3173137291696978700=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: a81de5e161: BUG: unable to handle kernel paging request at ffffc90000647e38
Date: Sat, 20 Aug 2016 23:47:35 -0700
Message-ID: <CALCETrUTOxVHffaqzkiv1dGgM5+cUOUWTt9bD3NWVi9YqTzThg@mail.gmail.com>
In-Reply-To: <57b92a5e.LtbFjOy5dxaJTqSl%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3173137291696978700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2016 at 9:13 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/vmap_s=
tack
> commit a81de5e16134480cc93596945601f19e1ace7723 ("[DEBUG] forcibly free s=
tacks immediately")
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap =
-smp 2 -m 1G
>
> caused below changes:
>

> [   22.412266]  [<ffffffff8129eeed>] do_task_stat+0x3cb/0x93d

To anyone watching this, I found and fixed the bug.  And Ingo, if
you're watching, this bug is not present in the set of patches I
emailed you a few days ago.

--===============3173137291696978700==--

