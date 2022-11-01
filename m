Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B97E
	for <oe-lkp@lists.linux.dev>; Tue,  1 Nov 2022 11:14:42 +0000 (UTC)
Received: from canpemm100007.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N1nNK5cZlzRnsl;
	Tue,  1 Nov 2022 19:09:37 +0800 (CST)
Received: from canpemm500005.china.huawei.com (7.192.104.229) by
 canpemm100007.china.huawei.com (7.192.105.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 19:14:33 +0800
Received: from canpemm500005.china.huawei.com ([7.192.104.229]) by
 canpemm500005.china.huawei.com ([7.192.104.229]) with mapi id 15.01.2375.031;
 Tue, 1 Nov 2022 19:14:33 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: kernel test robot <yujie.liu@intel.com>
CC: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand
	<david@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [linus:master] [selftests/memory] 13023c33c9:
 kernel-selftests.memory-hotplug.mem-on-off-test.sh.fail
Thread-Topic: [linus:master] [selftests/memory] 13023c33c9:
 kernel-selftests.memory-hotplug.mem-on-off-test.sh.fail
Thread-Index: Adjt4wESSc/+YfD2QFSTt9INW1YibA==
Date: Tue, 1 Nov 2022 11:14:33 +0000
Message-ID: <7f67ed236c3c49c1a29877a3aa221e20@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.67.110.209]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CFilter-Loop: Reflected

Hi!

>=20
> Hi Gongyi,
>=20
> We noticed that below commit may change the exit status of
> memory-hotplug selftest, please check if the test result is expected.
>=20
> We got same test log before this commit but with a good exit, though
> there were also some "Invalid argument" and "unexpected success" log.
> Please help give some guidance if there are any problems in our test flow=
.
> Thanks.
>=20
>=20
> Greeting,
>=20
> FYI, we noticed kernel-selftests.memory-hotplug.mem-on-off-test.sh.fail
> due to commit (built with gcc-11):
>=20
> commit: 13023c33c962730a38d6b43995910c8805637a9a
> ("selftests/memory-hotplug: Add checking after online or offline")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>=20
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-9313ba54-1_20221017
> with following parameters:
>=20
> 	group: memory-hotplug
>=20
> test-description: The kernel contains a set of "self tests" under the
> tools/testing/selftests/ directory. These are intended to be small unit t=
ests
> to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>=20
>=20
> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
> (Skylake) with 28G memory
>=20
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
>=20
>=20
> 2022-10-28 01:04:44 make quicktest=3D1 run_tests -C memory-hotplug
> make: Entering directory
> '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-13023c33c962730a38
> d6b43995910c8805637a9a/tools/testing/selftests/memory-hotplug'
> TAP version 13
> 1..1
> # selftests: memory-hotplug: mem-on-off-test.sh # Test scope: 2% hotplug
> memory
> # 	 online all hot-pluggable memory in offline state:
> # 		 SKIPPED - no hot-pluggable memory in offline state
> # 	 offline 2% hot-pluggable memory in online state
> # 	 trying to offline 5 out of 224 memory block(s):
> # online->offline memory0
> # ./mem-on-off-test.sh: line 78: echo: write error: Invalid argument #
> offline_memory_expect_success 0: unexpected fail # online->offline
> memory1 # online->offline memory10 # online->offline memory100 #
> online->offline memory101 # online->offline memory102
> # 	 online all hot-pluggable memory in offline state:
> # offline->online memory1
> # offline->online memory10
> # offline->online memory100
> # offline->online memory101
> # offline->online memory102
> # 	 Test with memory notifier error injection
> # ./mem-on-off-test.sh: line 267: echo: write error: Invalid argument #

I can not reproduce the error according to the file 'reproduce'.=20

Line 267 is not runnable on my system. Is there something wrong here?

The code on my system like:

266 #
267 # Offline $ratio percent of hot-pluggable memory
268 #
269 echo 0 > $NOTIFIER_ERR_INJECT_DIR/actions/MEM_GOING_OFFLINE/error
270 for memory in `hotpluggable_online_memory`; do
271         if [ $((RANDOM % 100)) -lt $ratio ]; then
272                 offline_memory_expect_success $memory &>/dev/null
273         fi
274 done


> online_memory_expect_fail 142: unexpected success #
> online_memory_expect_fail 190: unexpected success
> # ./mem-on-off-test.sh: line 287: echo: write error: Invalid argument #

The problem is similar with line 267.

> offline_memory_expect_fail 107: unexpected success #

It seems the error-inject not work.

Regards,
Gongyi
