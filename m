Content-Type: multipart/mixed; boundary="===============5311895264428123925=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [refcount] d2d337b185: WARNING:at_lib/refcount.c:#refcount_warn_saturate
Date: Tue, 03 Dec 2019 16:42:59 +0800
Message-ID: <11318ffd-f290-55f3-9471-f51de9973510@intel.com>
In-Reply-To: <20191203080932.GA6481@willie-the-truck>
List-Id: <oe-lkp.lists.linux.dev>

--===============5311895264428123925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/3/19 4:09 PM, Will Deacon wrote:
> On Tue, Dec 03, 2019 at 04:01:46PM +0800, Rong Chen wrote:
>> On 12/2/19 5:43 PM, Ard Biesheuvel wrote:
>>> On Sun, 1 Dec 2019 at 16:49, kernel test robot <rong.a.chen@intel.com=
> wrote:
>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>
>>>> commit: d2d337b185bd2abff262f3cf7de0080b3888e41c ("[RESEND PATCH v4
>>>> 08/10] refcount: Consolidate implementations of refcount_t")
>>>> url:
>>>> https://github.com/0day-ci/linux/commits/Will-Deacon/Rework-REFCOUNT_F=
ULL-using-atomic_fetch_-operations/20191124-052413
>>>>
>>>>
>>>> in testcase: ocfs2test
>>>> with following parameters:
>>>>
>>>>           disk: 1SSD
>>>>           test: test-mkfs
>>>>
>>> So we went from a success rate of 0 out of 24 to 0 out of 24 by
>>> applying that patch. How on earth is that a result that justifies
>>> spamming everybody?
>> These failures were triggered by ocfs2test test, and all tests were fail=
ed
>> include parent commit "2ab80bd4ae".
> https://lore.kernel.org/lkml/20191119182745.GA11397(a)willie-the-truck
> https://lore.kernel.org/lkml/20190912105640.2l6mtdjmcyyhmyun(a)willie-the=
-truck/
>
> The refcount code is doing its job afaict and its the ocfs2 code at fault.
>
> Will

Hi Will,

Thanks for your explanation, we'll disable the test.

Best Regards,
Rong Chen
--===============5311895264428123925==--

