Content-Type: multipart/mixed; boundary="===============5007900579380694052=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [direct] e594571852: xfstests.generic.299.fail
Date: Tue, 24 Nov 2015 09:51:56 +0800
Message-ID: <87lh9oyxj7.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151123112026.GE23418@quack.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5007900579380694052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jan Kara <jack@suse.cz> writes:

>   Hello,
>
> On Mon 23-11-15 16:29:25, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> git://internal_merge_and_test_tree
>> revert-e594571852b03a5503ba48edd718462e99bf238e-e594571852b03a5503ba48ed=
d718462e99bf238e
>> commit e594571852b03a5503ba48edd718462e99bf238e ("direct-io: Fix negativ=
e return from dio read beyond eof")
>
> Do you have the file:
>
> /lkp/benchmarks/xfstests/results//generic/299.full
>
> produced by the failed test? Thanks!

Sorry, we don't collect that data during regular regression test.  Is
that needed all the time?  We will change our test scripts to collect
that data.  But that need some time.

Best Regards,
Huang, Ying

--===============5007900579380694052==--

