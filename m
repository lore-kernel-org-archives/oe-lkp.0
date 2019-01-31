Content-Type: multipart/mixed; boundary="===============8137691944040138171=="
MIME-Version: 1.0
From: Tim Chen <tim.c.chen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Wed, 30 Jan 2019 16:06:36 -0800
Message-ID: <907779d2-09a8-47fb-4d77-c907cd716b3c@linux.intel.com>
In-Reply-To: <9a6fdc15-4ce1-9c55-d660-a9825b9ae104@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8137691944040138171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/27/18 6:55 PM, Waiman Long wrote:
> On 12/27/2018 08:31 PM, Wang, Kemi wrote:
>> Hi, Waiman
>>    Did you post that patch? Let's see if it helps.
> =

> I did post the patch a while ago. I will need to rebase it to a new
> baseline. Will do that in a week or 2.
> =

> -Longman
> =


Waiman,

In a large scale OLTP benchmark, we are also seeing a 1% loss in performance
from patch 9bc8039e71. We'll be interested to try out your patch to
restore some optimistic spinning on reader held sem.

Thanks.

Tim

--===============8137691944040138171==--

