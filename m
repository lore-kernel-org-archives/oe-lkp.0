Content-Type: multipart/mixed; boundary="===============6081669623774025254=="
MIME-Version: 1.0
From: edubezval@gmail.com
To: lkp@lists.01.org
Subject: Re: Adding Thermal SoC tree into 0-Day testing
Date: Fri, 28 Oct 2016 08:19:22 -0700
Message-ID: <CAC-25o8_1br7DqOicViQH6s5hDpScy=6mVcf-1HYMbwBzyge1Q@mail.gmail.com>
In-Reply-To: <20161028144325.GA15479@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6081669623774025254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey Philip,

On Fri, Oct 28, 2016 at 7:43 AM, Philip Li <philip.li@intel.com> wrote:
> On Fri, Oct 28, 2016 at 07:26:50AM -0700, edubezval(a)gmail.com wrote:
>> Philip,
>>
>> On Fri, Oct 28, 2016 at 1:29 AM, Philip Li <philip.li@intel.com> wrote:
>> > On Thu, Oct 27, 2016 at 10:29:23PM -0700, edubezval(a)gmail.com wrote:
>> >> Hello 0-Day team,
>> >>
>> >> I would like to ask you if you could add my tree to your testing serv=
ice:
>> >>
>> >> tree: https://git.kernel.org/cgit/linux/kernel/git/evalenti/linux-soc=
-thermal.git/
>> >> branches: linus, next, for-kernelci
>> >>
>> >> Would you also send reports on changes in the branches?
>> >
>> > sure, np, to confirm, currently we have below repo monitored, and this=
 one is a different one, right?
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-the=
rmal.git
>> >
>>
>> Cool, I am still getting familiar with 0-Day. I did not realize you
>> guys monitor per repo, not per branch. Great!
> thanks, and do you still need us to add the new repo https://git.kernel.o=
rg/cgit/linux/kernel/git/evalenti/linux-soc-thermal.git/?
>


I missed your question. Even though they are different URL, they will
redirect to same repo. So, I believe I am good.

>>
>> I have a couple of questions.
>>
>> How do I access build reports and test reports? Is the mailing list
>> the right place, or do you also have a place with your past / current
>> results?
> Currently you will receive report when there's any regression detected. I=
 will later add build success notification to you as well.
> The place to check is https://lists.01.org/pipermail/kbuild-all/, and htt=
ps://lists.01.org/pipermail/lkp/ for all reports.
>
>>
>> I saw that you do a simple read of thermal zone temperatures, and
>> cooling devices actions, which is great for me. If I want to extend
>> thermal tests, how do I do it?
>>
>> And finally, which archs and devices do you test?
> For thermal related questions, let me consult more members and back to yo=
u later.

OK Great. No rush here.

It would be nice to know which board/devices you have in the farm for
boot/testing.

BR,


>
>>
>> BR,
>>
>> >>
>> >> BR,
>> >>
>> >> --
>> >> Eduardo Bezerra Valentin
>> >> _______________________________________________
>> >> LKP mailing list
>> >> LKP(a)lists.01.org
>> >> https://lists.01.org/mailman/listinfo/lkp
>>
>>
>>
>> --
>> Eduardo Bezerra Valentin



-- =

Eduardo Bezerra Valentin

--===============6081669623774025254==--

