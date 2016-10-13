Content-Type: multipart/mixed; boundary="===============4678312171970479018=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: OOM in v4.8
Date: Thu, 13 Oct 2016 14:23:54 +0800
Message-ID: <519d7220-9750-7be7-436e-407d4dc95d67@intel.com>
In-Reply-To: <24ea68df-8b6c-5319-a8ef-9c4f237cfc2a@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4678312171970479018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/12/2016 04:24 PM, Aaron Lu wrote:
> On 10/12/2016 04:00 PM, Michal Hocko wrote:
>> On Wed 12-10-16 09:44:11, Michal Hocko wrote:
>>> [Let's CC Vlastimil]
>>>
>>> On Wed 12-10-16 14:54:23, Aaron Lu wrote:
>>>> Hello,
>>>>
>>>> There is a chromeswap test case:
>>>> https://chromium.googlesource.com/chromiumos/third_party/autotest/+/ma=
ster/client/site_tests/platform_CompressedSwapPerf
>>>>
>>>> We have done small changes and ported it to our LKP environment:
>>>> https://github.com/aaronlu/chromeswap
>>>>
>>>> The test starts nr_procs processes and let them each allocate some
>>>> memory equally with realloc, so anonymous pages are used. When the
>>>> pre-specified swap_target is reached, the allocation will stop. The
>>>> total allocation size is: MemFree + swap_target * SwapTotal.
>>>> After allocation, a random process is selected to touch its memory to
>>>> trigger swap in/out.
>>>>
>>>> For this test, nr_procs is 50 and swap_target is 50%.
>>>> The test box has 8G memory where 4G is used as a pmem block device and
>>>> created as the swap partition.
>>>>
>>>> There is OOM occured for this test recently so I did more tests:
>>>> on v4.6, 10 tests all pass;
>>>> on v4.7, 2 tests OOMed out of 10 tests;
>>>> on v4.8, 6 tests OOMed out of 10 tests;
>>>> on 101105b1717f, which is yersterday's Linus' master branch head,
>>>> 1 test OOMed out of 10 tests.
>>>
>>> Could you try to retest with the current linux-next please?
>>
>> And I am obviously blind because you have already tested with
>> 101105b1717f which contains the Andrew patchbomb and so all the relevant
>> changes. Now that I am lookinig into your log for that kernel there
>> doesn't seem to be any OOM killer invocation. There is only
>> kern  :warn  : [  177.175954] perf: page allocation failure: order:2, mo=
de:0x208c020(GFP_ATOMIC|__GFP_COMP|__GFP_ZERO)
> =

> Oh right, perf may fail but that shouldn't make the test be terminated.
> I'll need to check why OOM is marked for that test.

There is a monitor in our test infrastructure that periodically checks
dmesg for messages like "out of memory", "page allocation failure", etc.
And if those messages are found, the test is believed not trustworthy
and killed since most of our tests are performance related.

That is the reason why "perf page allocation failure" caused the test to
be marked OOM. I tried to not start perf and with commit 101105b1717f,
10 tests finished without any OOM failures.

Thanks,
Aaron

> =

> Another possibility is, OOM occurred later when the chromeswap test is
> requesting memory but for some reason, the log isn't properly saved.
> =

>>
>> which is an atomic high order request that failed which is not all that
>> unexpected when the system is low on memory. The allocation failure
>> report is hard to read because of unexpected end-of-lines but I suspect
> =

> Sorry about that, I'll try to find out why dmesg is saved so ugly on
> that test box.
> =

>> that again we are not able to allocate because of the CMA standing in
>> the way. I wouldn't call the above failure critical though.
>  =

> I'll test that commit and v4.8 again with cma=3D0 added to cmdline.
> =

> Thanks for taking a look at this.
> =

> Regards,
> Aaron
> =



--===============4678312171970479018==--

