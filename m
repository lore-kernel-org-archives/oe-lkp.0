Content-Type: multipart/mixed; boundary="===============8043984896999639738=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [vfs] WARNING: CPU: 3 PID: 2339 at mm/truncate.c:758 pagecache_isize_extended+0xdd/0x120()
Date: Thu, 16 Oct 2014 13:01:27 +0200
Message-ID: <20141016110127.GD6085@quack.suse.cz>
In-Reply-To: <20141016100913.GA8140@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8043984896999639738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 16-10-14 18:09:13, Wu Fengguang wrote:
> Hi Jan,
> =

> Your patch gives a warning on the xfs code path. :)
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> commit be330474e2d0533a7a6185e567f3654fec096dbd ("vfs: fix data corruptio=
n when blocksize < pagesize for mmaped data")
...

> <5>[   25.956576] XFS (sda1): Mounting V4 Filesystem
> <6>[   26.194468] XFS (sda1): Ending clean mount
> <4>[   27.258450] ------------[ cut here ]------------
> <4>[   27.258789] WARNING: CPU: 3 PID: 2339 at mm/truncate.c:758 pagecach=
e_isize_extended+0xdd/0x120()
  Ah, I believe this is:
WARN_ON(!mutex_is_locked(&inode->i_mutex));
  because XFS doesn't use i_mutex but its private rwlock. I forgot to check
dmesg after running xfstests for XFS and didn't notice this. Anyway, the
solution is to just remove the assertion since it doesn't hold for all
filesystems. Patch for that is attached. Thanks Fengguang for catching
this.

								Honza

> <4>[   27.259443] Modules linked in: ipmi_watchdog ipmi_msghandler btrfs =
xor raid6_pq sg sr_mod cdrom sd_mod firewire_ohci firewire_core crc_itu_t s=
nd_hda_codec_realtek pcspkr snd_hda_codec_generic ahci libahci libata snd_h=
da_intel i2c_i801 snd_hda_controller parport_pc parport snd_hda_codec snd_h=
wdep snd_pcm snd_timer shpchp snd x38_edac edac_core soundcore acpi_cpufreq
> <4>[   27.262734] CPU: 3 PID: 2339 Comm: fallocate Not tainted 3.17.0-gda=
9a9f1 #1
> <4>[   27.263153] Hardware name:                  /        , BIOS VVRBLI9=
J.86A.2891.2007.0511.1144 05/11/2007
> <4>[   27.263780]  0000000000000009 ffff88007a43fd88 ffffffff81859ea6 000=
0000000000000
> <4>[   27.264492]  ffff88007a43fdc0 ffffffff8106ef0d 0000000000001000 fff=
f88005b6f05a8
> <4>[   27.265199]  0000000000000000 ffff88005b6f05a8 0000000004000000 fff=
f88007a43fdd0
> <4>[   27.265906] Call Trace:
> <4>[   27.266165]  [<ffffffff81859ea6>] dump_stack+0x4d/0x66
> <4>[   27.266511]  [<ffffffff8106ef0d>] warn_slowpath_common+0x7d/0xa0
> <4>[   27.266900]  [<ffffffff8106efea>] warn_slowpath_null+0x1a/0x20
> <4>[   27.267286]  [<ffffffff8117020d>] pagecache_isize_extended+0xdd/0x1=
20
> <4>[   27.267690]  [<ffffffff811712b7>] truncate_setsize+0x27/0x40
> <4>[   27.268068]  [<ffffffff8133eab7>] xfs_setattr_size+0x157/0x3a0
> <4>[   27.268442]  [<ffffffff8134c827>] ? xfs_trans_commit+0x157/0x250
> <4>[   27.268821]  [<ffffffff813336df>] xfs_file_fallocate+0x2df/0x300
> <4>[   27.269215]  [<ffffffff811dbb09>] ? __sb_start_write+0x49/0xf0
> <4>[   27.269596]  [<ffffffff813923b4>] ? selinux_file_permission+0xc4/0x=
120
> <4>[   27.270009]  [<ffffffff811d7563>] do_fallocate+0x123/0x1b0
> <4>[   27.270380]  [<ffffffff811d7633>] SyS_fallocate+0x43/0x70
> <4>[   27.270738]  [<ffffffff81862c69>] system_call_fastpath+0x16/0x1b
> <4>[   27.271119] ---[ end trace 6a3b1350ad399610 ]---
> <4>[   27.274498] ------------[ cut here ]------------

--===============8043984896999639738==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mm-Remove-false-WARN_ON-from-pagecache_isize_extende.patch"

PkZyb20gZGUzNDI2ZDY0OTVmNGI0NGIxNGMwOWI3YzcyMDJlOWE4NmQ4NjRiOSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KRGF0ZTogVGh1LCAx
NiBPY3QgMjAxNCAxMjo1ODo0MiArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIG1tOiBSZW1vdmUgZmFs
c2UgV0FSTl9PTiBmcm9tIHBhZ2VjYWNoZV9pc2l6ZV9leHRlbmRlZCgpCgpUaGUgV0FSTl9PTiBj
aGVja2luZyB3aGV0aGVyIGlfbXV0ZXggaXMgaGVsZCBpbgpwYWdlY2FjaGVfaXNpemVfZXh0ZW5k
ZWQoKSB3YXMgd3JvbmcgYmVjYXVzZSBzb21lIGZpbGVzeXN0ZW1zIChlLmcuClhGUykgdXNlIGRp
ZmZlcmVudCBsb2NrcyBmb3Igc2VyaWFsaXphdGlvbiBvZiB0cnVuY2F0ZXMgLyB3cml0ZXMuIFNv
Cmp1c3QgcmVtb3ZlIHRoZSBjaGVjay4KClNpZ25lZC1vZmYtYnk6IEphbiBLYXJhIDxqYWNrQHN1
c2UuY3o+Ci0tLQogbW0vdHJ1bmNhdGUuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tbS90cnVuY2F0ZS5jIGIvbW0vdHJ1bmNhdGUuYwppbmRleCAy
NjFlYWY2ZTVhMTkuLmM2NDYwODRlNWVlYyAxMDA2NDQKLS0tIGEvbW0vdHJ1bmNhdGUuYworKysg
Yi9tbS90cnVuY2F0ZS5jCkBAIC03NTUsNyArNzU1LDYgQEAgdm9pZCBwYWdlY2FjaGVfaXNpemVf
ZXh0ZW5kZWQoc3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IGZyb20sIGxvZmZfdCB0bykKIAlz
dHJ1Y3QgcGFnZSAqcGFnZTsKIAlwZ29mZl90IGluZGV4OwogCi0JV0FSTl9PTighbXV0ZXhfaXNf
bG9ja2VkKCZpbm9kZS0+aV9tdXRleCkpOwogCVdBUk5fT04odG8gPiBpbm9kZS0+aV9zaXplKTsK
IAogCWlmIChmcm9tID49IHRvIHx8IGJzaXplID09IFBBR0VfQ0FDSEVfU0laRSkKLS0gCjEuOC4x
LjQKCg==

--===============8043984896999639738==--

