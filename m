Content-Type: multipart/mixed; boundary="===============8110401492116205759=="
MIME-Version: 1.0
From: Baowen Zheng <baowen.zheng@corigine.com>
To: lkp@lists.01.org
Subject: Re: [flow_offload] 42adbf37c1: kernel-selftests.tc-testing.d4cd.Add_skbedit_action_with_valid_mark_and_mask.fail
Date: Fri, 17 Dec 2021 08:32:17 +0000
Message-ID: <
 <DM5PR1301MB2172590322BA203B779BFCDBE7789@DM5PR1301MB2172.namprd13.prod.outlook.com>>
In-Reply-To: <20211216135013.GF10708@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8110401492116205759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Oliver for bring this to us. =

We will make the verification and fix this issue in our next patch series.

On December 16, 2021 9:50 PM, Oliver Sang wrote:
>Greeting,
>
>FYI, we noticed the following commit (built with gcc-9):
>
>commit: 42adbf37c1328d01d24a214c044f9707fba75dfd ("[PATCH v6 net-next
>07/12] flow_offload: add skip_hw and skip_sw to control if offload the act=
ion")
>url: https://github.com/0day-ci/linux/commits/Simon-Horman/allow-user-to-
>offload-tc-action-to-net-device/20211209-173033
>base: https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git
>9d922f5df53844228b9f7c62f2593f4f06c0b69b
>patch link: https://lore.kernel.org/netdev/20211209092806.12336-8-
>simon.horman(a)corigine.com
>
>in testcase: kernel-selftests
>version: kernel-selftests-x86_64-4b301b87-1_20211215
>with following parameters:
>
>	group: tc-testing
>	ucode: 0xde
>
>test-description: The kernel contains a set of "self tests" under the
>tools/testing/selftests/ directory. These are intended to be small unit te=
sts to
>exercise individual code paths in the kernel.
>test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
>
>on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700K CPU @
>4.20GHz with 32G memory
>
>caused below changes (please refer to attached dmesg/kmsg for entire
>log/backtrace):
>
>
>
>
>If you fix the issue, kindly add following tag
>Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
>
># ok 347 407b - Add skbedit action with mark exceeding 32-bit maximum # not
>ok 348 d4cd - Add skbedit action with valid mark and mask
># 	Command exited with 255, expected 0
># RTNETLINK answers: Operation not supported # We have an error talking to
>the kernel # # not ok 349 baa7 - Add skbedit action with valid mark and 32=
-bit
>maximum mask
># 	Command exited with 255, expected 0
># RTNETLINK answers: Operation not supported # We have an error talking to
>the kernel # # ok 350 62a5 - Add skbedit action with valid mark and mask
>exceeding 32-bit maximum
>
>
>
>To reproduce:
>
>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        sudo bin/lkp install job.yaml           # job file is attached in =
this email
>        bin/lkp split-job --compatible job.yaml # generate the yaml file f=
or lkp run
>        sudo bin/lkp run generated-yaml-file
>
>        # if come across any failure that blocks the test,
>        # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
>---
>0DAY/LKP+ Test Infrastructure                   Open Source Technology Cen=
ter
>https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpor=
ation
>
>Thanks,
>Oliver Sang


--===============8110401492116205759==--

