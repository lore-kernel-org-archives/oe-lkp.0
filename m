Content-Type: multipart/mixed; boundary="===============4222974735353029509=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [btrfs] "fio: pid=2214, got signal=7" error showed in fio test for btrfs
Date: Wed, 29 Mar 2017 15:36:54 +0800
Message-ID: <20170329073654.GK17604@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4222974735353029509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

We detected below error messages in fio pmem test for btrfs.

machine: Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz with 256G memory
kernel: v4.10 =

test parameters:

[global]
bs=3D2M
ioengine=3Dmmap
iodepth=3D32
size=3D7669584457
direct=3D0
runtime=3D200
invalidate=3D1
fallocate=3Dposix
group_reporting

time_based

[task_0]
rw=3Dwrite
directory=3D/fs/pmem0
numjobs=3D14

[task_1]
rw=3Dwrite
directory=3D/fs/pmem1
numjobs=3D14


=3D=3D> /tmp/stderr <=3D=3D
fio: pid=3D2214, got signal=3D7
fio: pid=3D2215, got signal=3D7
fio: pid=3D2217, got signal=3D7
fio: pid=3D2220, got signal=3D7
fio: pid=3D2222, got signal=3D7
fio: pid=3D2224, got signal=3D7
fio: pid=3D2225, got signal=3D7
fio: pid=3D2227, got signal=3D7
fio: pid=3D2216, got signal=3D7
fio: pid=3D2218, got signal=3D7
fio: pid=3D2219, got signal=3D7
fio: pid=3D2221, got signal=3D7
fio: pid=3D2223, got signal=3D7
fio: pid=3D2226, got signal=3D7
fio: pid=3D2200, got signal=3D7
fio: pid=3D2201, got signal=3D7
fio: pid=3D2203, got signal=3D7
fio: pid=3D2204, got signal=3D7
fio: pid=3D2205, got signal=3D7
fio: pid=3D2208, got signal=3D7
fio: pid=3D2209, got signal=3D7
fio: pid=3D2210, got signal=3D7
fio: pid=3D2211, got signal=3D7
fio: pid=3D2212, got signal=3D7
fio: pid=3D2213, got signal=3D7
fio: pid=3D2202, got signal=3D7
fio: pid=3D2206, got signal=3D7
fio: pid=3D2207, got signal=3D7
fio: file hash not empty on exit

while fio test is ok for ext4 with the same test parameters.
Attached reproduce.sh may help reproduce the problem.

Thanks,
Xiaolong

--===============4222974735353029509==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

bW9kcHJvYmUgbmRfZTgyMApkbXNldHVwIHJlbW92ZV9hbGwKd2lwZWZzIC1hIC0tZm9yY2UgL2Rl
di9wbWVtMAp3aXBlZnMgLWEgLS1mb3JjZSAvZGV2L3BtZW0xCm1rZnMgLXQgYnRyZnMgL2Rldi9w
bWVtMQpta2ZzIC10IGJ0cmZzIC9kZXYvcG1lbTAKbWtkaXIgLXAgL2ZzL3BtZW0wCm1vdW50IC10
IGJ0cmZzIC9kZXYvcG1lbTAgL2ZzL3BtZW0wCm1rZGlyIC1wIC9mcy9wbWVtMQptb3VudCAtdCBi
dHJmcyAvZGV2L3BtZW0xIC9mcy9wbWVtMQoKZm9yIGZpbGUgaW4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1Ki9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZG8KCWVjaG8gcGVyZm9ybWFuY2Ug
PiAkZmlsZQpkb25lCgplY2hvICcKW2dsb2JhbF0KYnM9Mk0KaW9lbmdpbmU9bW1hcAppb2RlcHRo
PTMyCnNpemU9NzY2OTU4NDQ1NwpkaXJlY3Q9MApydW50aW1lPTIwMAppbnZhbGlkYXRlPTEKZmFs
bG9jYXRlPXBvc2l4Cmdyb3VwX3JlcG9ydGluZwoKdGltZV9iYXNlZAoKW3Rhc2tfMF0Kcnc9d3Jp
dGUKZGlyZWN0b3J5PS9mcy9wbWVtMApudW1qb2JzPTE0CgpbdGFza18xXQpydz13cml0ZQpkaXJl
Y3Rvcnk9L2ZzL3BtZW0xCm51bWpvYnM9MTQnIHwgZmlvIC0tb3V0cHV0LWZvcm1hdD1qc29uIC0K

--===============4222974735353029509==--

