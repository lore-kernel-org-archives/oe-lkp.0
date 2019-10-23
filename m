Content-Type: multipart/mixed; boundary="===============0550219132351912669=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 04dfd1bca6: unixbench.score -17.7% regression
Date: Wed, 23 Oct 2019 15:49:39 +0800
Message-ID: <9ff6d9f7-48de-d14c-cfcb-862850bd5d81@intel.com>
In-Reply-To: <CAKfTPtCs94J7jKSwPm9BTSrXOWPtVzv=JuaF0O==OZ=c_-sySQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0550219132351912669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/23/2019 3:28 PM, Vincent Guittot wrote:
> Hi Ron,
>
> On Wed, 23 Oct 2019 at 05:25, kernel test robot <rong.a.chen@intel.com>=
 wrote:
>> On Tue, Oct 22, 2019 at 03:02:25PM +0200, Vincent Guittot wrote:
>>> Hi Rong,
>>>
>>>
>>> On Mon, 21 Oct 2019 at 10:49, kernel test robot <rong.a.chen@intel.co=
m> wrote:
>>>> Greeting,
>>>>
>>>> FYI, we noticed a -17.7% regression of unixbench.score due to commit:
>>>>
>>> Thanks for testing and reporting the regression.
>>>
>>> I have pushed a patch on the branch that should fix the regression.
>>> Could you rerun the test with the fix ?
>>>
>>> The new top commit of the branch is:
>>> commit: ff61a177adcf60c6bbc96f4bf3d74f980c699558 ("sched/fair: fix
>>> rework of find_idlest_group()")
>> Hi Vincent,
>>
>> Thanks for the quick response, the commit can fix the regression.
>>
>> 2871f4abd7cefa0c  04dfd1bca609c5d1c8b7e073f7  ff61a177adcf60c6bbc96f4bf3=
  testcase/testparams/testbox
>> ----------------  --------------------------  --------------------------=
  ---------------------------
>>           %stddev      change         %stddev      change         %stddev
>>               \          |                \          |                \
>>        1070             -18%        881                        1060     =
   unixbench/performance-1-300s-execl/lkp-skl-fpga01
>>        1070             -18%        881                        1060     =
   GEO-MEAN unixbench.score
> Thanks for the testing
> Would you mind replying in the mailing list to add your tested-by on
> the patch ? I have cced you
Sure, it's my pleasure.

Best Regards,
Rong Chen


--===============0550219132351912669==--

