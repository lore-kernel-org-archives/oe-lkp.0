Content-Type: multipart/mixed; boundary="===============1953508183470693016=="
MIME-Version: 1.0
From: Dmitry Safonov <dima@arista.com>
To: lkp@lists.01.org
Subject: Re: [tty] f26eb68a52: INFO:task_blocked_for_more_than#seconds
Date: Fri, 14 Sep 2018 16:56:49 +0100
Message-ID: <1536940609.3185.29.camel@arista.com>
In-Reply-To: <20180914090151.GH7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1953508183470693016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-09-14 at 17:01 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-4.9):

Thanks,

[..]
> [  245.080051] INFO: task lkp-setup-rootf:500 blocked for more than
> 120 seconds.
> [  245.082850]       Tainted: G        W       T 4.19.0-rc3-00014-
> gf26eb68 #1
> [  245.084673] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  245.086455] lkp-setup-rootf D 6516   500    498 0x00000000
> [  245.087766] Call Trace:
> [  245.088391]  __schedule+0x4b1/0xe80
> [  245.089322]  schedule+0x25/0x60
> [  245.090178]  schedule_timeout+0x275/0x4e0
> [  245.091105]  ? __ldsem_down_write_nested+0x1aa/0x300
> [  245.092217]  __ldsem_down_write_nested+0x1b2/0x300
> [  245.093286]  ? ldsem_down_write+0x2a/0x2e
> [  245.094305]  ldsem_down_write+0x2a/0x2e
> [  245.095211]  tty_ldisc_lock+0x16/0x40
> [  245.096104]  tty_reopen+0x3f/0xc0
> [  245.096892]  tty_open+0x3cf/0x450
> [  245.097718]  chrdev_open+0x9c/0x1f0
> [  245.098511]  ? security_file_open+0x99/0xa0
> [  245.099512]  do_dentry_open+0x3d5/0x5d0
> [  245.100428]  ? inode_permission+0x95/0x180
> [  245.101351]  ? cdev_put+0x30/0x30
> [  245.102138]  vfs_open+0x2d/0x30
> [  245.102898]  path_openat+0x9e1/0x17d0
> [  245.103733]  do_filp_open+0x6a/0x120
> [  245.104541]  ? _raw_spin_unlock+0x22/0x30
> [  245.105439]  ? __alloc_fd+0xa5/0x170
> [  245.106309]  do_sys_open+0x13a/0x250
> [  245.107118]  sys_open+0x22/0x30
> [  245.107980]  do_int80_syscall_32+0x94/0x1c0
> [  245.108982]  entry_INT80_32+0xf3/0xf3

So, unfortunately, I'll still have to set timeout to 5 sec for
tty_reopen(). The better fix would be to release read lock whenever a
writer is pending (say n_tty_receive_buf_common() can fallback), but
that's probably better to put in another patches set, as this one is
already packed.
Annoyingly, it means that open(tty) will have now more chances to fail
then before.. But still it's better than a panic with null-ptr deref.

-- =

Thanks,
             Dmitry

--===============1953508183470693016==--

