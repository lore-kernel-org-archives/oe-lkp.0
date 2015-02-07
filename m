Content-Type: multipart/mixed; boundary="===============6121443076513097934=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [NFSv4.1] 6ae373394c4: kernel boot crash
Date: Fri, 06 Feb 2015 18:45:46 -0800
Message-ID: <20150207024546.GA27323@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6121443076513097934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Trond,

We noticed the below kernel crash on

git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
commit 6ae373394c4257bad562817aa60464ff7fe8f9c4 ("NFSv4.1: Ask for no deleg=
ation on OPEN if using O_DIRECT")


testbox/testcase/testparams: vm-vp-quantal-x86_64/boot/1

0e3b137fbf0f4ab9  6ae373394c4257bad562817aa6  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :100          4%           2:46    dmesg.BUG:kernel_test_crashed

The last dmesg lines before the kernel crash are

[    0.274266] NET: Registered protocol family 1
[    0.275236] RPC: Registered named UNIX socket transport module.
[    0.276123] RPC: Registered udp transport module.
[    0.276860] RPC: Registered tcp transport module.
[    0.277617] RPC: Registered tcp NFSv4.1 backchannel transport module

Thanks,
Fengguang

--===============6121443076513097934==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBib290CmRlZmF1bHQtbW9uaXRvcnM6IApkZWZhdWx0X3dhdGNoZG9nczoK
ICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCm1vZGVsOiBxZW11
LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0KbnJfdm06IDY0Cm5yX2NwdTogMgptZW1vcnk6IDM2
ME0Kcm9vdGZzOiBxdWFudGFsLWNvcmUteDg2XzY0LmNnegpib290LXNsYWJpbmZvOiAKYm9vdC1t
ZW1pbmZvOiAKbWVtbWFwOiAKYm9vdC1tZW1vcnk6IApib290LXRpbWU6IAprZXJuZWwtc2l6ZTog
CnNsZWVwOiAxCmJyYW5jaDogbmZzL2xpbnV4LW5leHQKY29tbWl0OiA2YWUzNzMzOTRjNDI1N2Jh
ZDU2MjgxN2FhNjA0NjRmZjdmZThmOWM0CnJlcGVhdF90bzogMgp0ZXN0Ym94OiB2bS12cC1xdWFu
dGFsLXg4Nl82NC0zCnRib3hfZ3JvdXA6IHZtLXZwLXF1YW50YWwteDg2XzY0Cmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wMi0wNSAxODo1NDo0Mi4zMjMzNjQ0MTcgKzA4
OjAwCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvNmFlMzczMzk0YzQyNTdiYWQ1NjI4MTdh
YTYwNDY0ZmY3ZmU4ZjljNC92bWxpbnV6LTMuMTkuMC1yYzUtZzZhZTM3MzMiCnVzZXI6IGxrcApx
dWV1ZTogcmFuZApyZXN1bHRfcm9vdDogIi9yZXN1bHQvdm0tdnAtcXVhbnRhbC14ODZfNjQvYm9v
dC8xL3F1YW50YWwtY29yZS14ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzZhZTM3MzM5NGM0MjU3YmFk
NTYyODE3YWE2MDQ2NGZmN2ZlOGY5YzQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC92bS12
cC1xdWFudGFsLXg4Nl82NC0zL3JhbmRfYm9vdC0xLXF1YW50YWwtY29yZS14ODZfNjQuY2d6LXg4
Nl82NC1yaGVsLTZhZTM3MzM5NGM0MjU3YmFkNTYyODE3YWE2MDQ2NGZmN2ZlOGY5YzQtMS55YW1s
IgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDItMDUgMTg6NTU6NDkuNjAyMzI0ODQxICswODowMApqb2Jf
c3RhdGU6IGZpbmlzaGVkCg==

--===============6121443076513097934==--

