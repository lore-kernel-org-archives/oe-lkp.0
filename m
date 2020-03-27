Content-Type: multipart/mixed; boundary="===============0784611879698799100=="
MIME-Version: 1.0
From: Deepa B <deepa01012015@gmail.com>
To: lkp@lists.01.org
Subject: IOZone error
Date: Fri, 27 Mar 2020 15:28:37 +0530
Message-ID: <CANmdEh2ML7_yfck-3GGdc6FcXgJCesshkAxmxFToCG8gxmK+-w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0784611879698799100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
Iozone benchmark is run through LKP on X86 (Linux kernel - 5.3.0,
Intel(R) Pentium(R) CPU  N3710  @ 1.60GHz) & RISC-V U540(Yocto Linux
kernel - 5.4.3). Get same error with HDD disks on both.

Command:  lkp run ./iozone-2HDD-ext4-kyber.yaml
rm due to not enough HDD disks
need: 2, has: 0
Traceback (most recent call last):
6: from /home/test/Ankita/lkp-tests/bin/run-local:131:in

' 5: from /home/test/Ankita/lkp-tests/lib/job.rb:691:in expand_params'
4: from /home/test/Ankita/lkp-tests/lib/job.rb:77:in for_each_in' 3:
from /home/test/Ankita/lkp-tests/lib/job.rb:77:in each'
2: from /home/test/Ankita/lkp-tests/lib/job.rb:78:in block in
for_each_in' 1: from /home/test/Ankita/lkp-tests/lib/job.rb:694:in
block in expand_params'
/home/test/Ankita/lkp-tests/lib/job.rb:669:in `run_filter':
/home/test/Ankita/lkp-tests/filters/disk: exitstatus 1
(Job::ParamError)

Could you please help us resolve this?

Thanks,
Deepa
--===============0784611879698799100==--

