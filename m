Content-Type: multipart/mixed; boundary="===============1740412669992070015=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/hugetlb] c77c0a8ac4: will-it-scale.per_process_ops 15.9% improvement
Date: Tue, 14 Jan 2020 09:57:14 -0500
Message-ID: <bd474ca4-9f47-0ab1-f461-513789fc074d@redhat.com>
In-Reply-To: <20200114091251.GE19428@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1740412669992070015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/14/20 4:12 AM, Michal Hocko wrote:
> On Tue 14-01-20 16:56:37, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a 15.9% improvement of will-it-scale.per_process_ops due=
 to commit:
>>
>>
>> commit: c77c0a8ac4c522638a8242fcb9de9496e3cdbb2d ("mm/hugetlb: defer fre=
eing of huge pages if in non-task context")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> This is more than surprising because the patch has only changed the
> behavior for hugetlb pages freed from the (soft)interrupt context and
> that should be a very rare event. Does the test really generate a lot of
> those?
>
Yes, I have the same question. I was not expecting to see any
performance impact.

Cheers,
Longman

--===============1740412669992070015==--

