Content-Type: multipart/mixed; boundary="===============4971343544829627449=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [x86] 784d5699ed: kmsg.ip_tables:no_symbol_version_for_copy_from_user
Date: Fri, 30 Sep 2016 09:26:58 +1000
Message-ID: <20160930092658.0da22cad@canb.auug.org.au>
In-Reply-To: <20160920025532.GC30020@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4971343544829627449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 20 Sep 2016 10:55:32 +0800 kernel test robot <xiaolong.ye@intel.c=
om> wrote:
>
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 784d5699eddc55878627da20d3fe0c8542e2f1a2 ("x86: move exports to ac=
tual definitions")
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes:
> =

> [    4.386609] ip_tables: no symbol version for _copy_from_user
> [    4.387902] ip_tables: Unknown symbol _copy_from_user (err -22)
> [    4.389219] ip_tables: no symbol version for __put_user_2
> [    4.390473] ip_tables: Unknown symbol __put_user_2 (err -22)
> [    4.391760] ip_tables: no symbol version for __sw_hweight32
> [    4.393031] ip_tables: Unknown symbol __sw_hweight32 (err -22)
> [    4.394332] ip_tables: no symbol version for memcpy
> [    4.395508] ip_tables: Unknown symbol memcpy (err -22)
> [    4.396729] ip_tables: no symbol version for __fentry__
> [    4.397937] ip_tables: Unknown symbol __fentry__ (err -22)
> [    4.399234] ip_tables: no symbol version for _copy_to_user
> [    4.400488] ip_tables: Unknown symbol _copy_to_user (err -22)
> [    4.405835] systemd[1]: Failed to insert module 'ip_tables': Invalid a=
rgument
> =

> =

> =

> Thanks,
> Xiaolong

Do we have any resolution of this?

-- =

Cheers,
Stephen Rothwell

--===============4971343544829627449==--

