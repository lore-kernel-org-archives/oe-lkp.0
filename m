Content-Type: multipart/mixed; boundary="===============0746595992045175459=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Wed, 19 Sep 2018 08:47:37 +0800
Message-ID: <a1533cac-372f-5c21-3e32-21f6f32d800f@intel.com>
In-Reply-To: <CAAeHK+zD9zDTaFnRDkDvtGy4pVuKH09vx5YWy-EqsMQeihx0-g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0746595992045175459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/18/2018 11:49 PM, Andrey Konovalov wrote:
> On Tue, Sep 18, 2018 at 10:57 AM, Rong Chen <rong.a.chen@intel.com> wro=
te:
>>
>> On 09/13/2018 09:00 AM, Rong Chen wrote:
>>
>>
>>
>> On 09/12/2018 07:41 PM, Andrey Konovalov wrote:
>>
>> That commit only adds noop annotations, so this is most likely a false
>> positive. I also can't make anything out of the error log you
>> provided.
>>
>> The issue is that the binary paths become garbled from this commit,
>> and it can be reproduced on 0day-ci tree in high probability,
>> It's possible that the commit is influenced by other merged commits.
>> Could you confirm it on your own tree if you have time?
>>
>> Hi Andrey,
>>
>> Any update on this?
>>
>>
>> Best Regards,
>> Rong Chen
> Hi Rong,
>
> I'll take a look this week.
>
> Do I understand correctly that I need to run the repro with my
> patchset and without and check whether it differs?
>
> Thanks!
Could you help to compare the 0day-ci repo =

(https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-user=
-pointers-passed-to-the-kernel/20180831-042151)
with your repo if there's no problem on your repo? btw, 0day robot =

merged the patchset based on v4.19-rc1, is this right?

Best Regards,
Rong Chen

--===============0746595992045175459==--

