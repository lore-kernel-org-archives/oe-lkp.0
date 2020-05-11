Content-Type: multipart/mixed; boundary="===============6183955592909312947=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] f2af7d90e2: xfstests.btrfs.052.fail
Date: Mon, 11 May 2020 09:36:03 +0800
Message-ID: <01134103-4ca4-958a-f627-a17097315429@intel.com>
In-Reply-To: <20200511011601.GV16070@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6183955592909312947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/11/20 9:16 AM, Matthew Wilcox wrote:
> On Mon, May 11, 2020 at 09:09:57AM +0800, kernel test robot wrote:
>>      --- tests/btrfs/095.out	2020-04-09 10:45:28.000000000 +0800
>>      +++ /lkp/benchmarks/xfstests/results//btrfs/095.out.bad	2020-05-06 =
21:13:51.276485703 +0800
>>      @@ -1,35 +1,9 @@
>>       QA output created by 095
>>      -Blocks modified: [135 - 164]
>>      -Blocks modified: [768 - 792]
>>      +awk: line 19: function strtonum never defined
>>      +awk: line 19: function strtonum never defined
>>      +awk: line 19: function strtonum never defined
>>      +awk: line 19: function strtonum never defined
> This looks like a problem with the test setup.
>

Hi Matthew,

Thanks for the response, we'll double check it.

Best Regards,
Rong Chen
--===============6183955592909312947==--

