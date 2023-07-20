Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DD182AC
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 13:47:05 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-47ec8c9d7a0so351268e0c.3
        for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 06:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689860824; x=1690465624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/KzGUPV+gRIoFyLtOO+EoChD6058pkzNkr89rkXrzY=;
        b=k8hzU5f32OK+nRBlMQj62JtuATPqhubzrc5L2RELADpAANLjkncROzrP2NuRTibSxc
         Tb8rGJMCn15CjbKw5c5laQhuiFupJr4qYdRM+1qzOWTQwR17hOywEcQTv7qzZpv5Kgtq
         Kw82IUcxsCJ5VpJfABxVUulbQiSfzUpckoo5wYAL4sfBluPf6QtZiRJPE4N4YLeaDO4B
         UPlW1LXsggBaZkAc/vETtXP4VKbIYqN5lSmNEjhRJkDOoNHGjk9YGD69gYwxZs3vopNR
         Jq/BvLp1MbQ0uFolMFAt3soHoA5qAu8SbzRvF8fdAMj62uppFHspA/bUimeXYjutQ+te
         aI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860824; x=1690465624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/KzGUPV+gRIoFyLtOO+EoChD6058pkzNkr89rkXrzY=;
        b=WMbmuulTSW4Dy20+XOzSiPgjVgQO+NGZukStSqCrRytMj6GbICDD8Ve9O+A7KIKDAh
         J/odxe0dBGwg/MtSYqtj8yBakrfxUSLFkZQg1VeaGgKTbEqcU37PdHdXsNIKzGCB8wCt
         mpgPY5yPSksVSIFEzBWG++kb9aQ8tyMuUS+vB/G3BnX2QPUxp/69dpWRm5hKbxg54xfH
         9F6wyxP5SjRf80PpqtxDVbYYaBhFfVW49AwUI2qCCVANAHeMeYfJ5XN02uVjj9MRZmEZ
         Rja2IV2gYlvqhPyzB+c9OahtZuTnzQTm0PqgK3iDPtNS6Ts3MM5nBEg4JXvoTYqhuSuB
         e22Q==
X-Gm-Message-State: ABy/qLY0V1EM1I0iMWP/yAIM/yJmlDw2Lv17PBiw2E1WVcnx4aNDm61K
	q4C39CW1IvCwjxPE44tDKlcx+G/HDdUlMF2OLxgRUUs3P4mBEg==
X-Google-Smtp-Source: APBJJlGpznh68/APdZ9brOuv7vnzzwzJfPIpxpcjgys5irqfGmvSReUPuIi7ZQ8yi1+M2560n/TLl4FN5ZvPHeg5QDI=
X-Received: by 2002:a1f:5cd7:0:b0:483:9adf:af19 with SMTP id
 q206-20020a1f5cd7000000b004839adfaf19mr6230502vkb.2.1689860823787; Thu, 20
 Jul 2023 06:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com> <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020> <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
In-Reply-To: <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Thu, 20 Jul 2023 22:46:51 +0900
Message-ID: <CAB=+i9Rn0WXgK-CfaKy0k7HXHx3VEmSjzopaPakcThSG5Ri3vA@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jay Patel <jaypatel@linux.ibm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, cl@linux.com, penberg@kernel.org, rientjes@google.com, 
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, piyushs@linux.ibm.com
Content-Type: multipart/mixed; boundary="0000000000001f3de90600eb622a"

--0000000000001f3de90600eb622a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 9:59=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gmail.com>=
 wrote:
> On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@intel.c=
om> wrote:
> > > > commit:
> > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5=
/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > >
> > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-meminf=
o.node1.Active
> > > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-meminf=
o.node1.Active(anon)
> > > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-vmstat=
.node1.nr_active_anon
> > > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-vmstat=
.node1.nr_zone_active_anon
> > >
> > > I'm quite baffled while reading this.
> > > How did changing slab order calculation double the number of active a=
non pages?
> > > I doubt two experiments were performed on the same settings.
> >
> > let me introduce our test process.
> >
> > we make sure the tests upon commit and its parent have exact same envir=
onment
> > except the kernel difference, and we also make sure the config to build=
 the
> > commit and its parent are identical.
> >
> > we run tests for one commit at least 6 times to make sure the data is s=
table.
> >
> > such like for this case, we rebuild the commit and its parent's kernel,=
 the
> > config is attached FYI.

Oh I missed the attachments.
I need more time to look more into that, but could you please test
this patch (attached)?

>    0.00          -100.0%       0.00        numa-numastat.node0.interleave=
_hit
>   646925 =C2=B1 26%     +25.4%     811509 =C2=B1 29%  numa-numastat.node0=
.local_node
>    693386 =C2=B1 20%     +30.4%     904091 =C2=B1 27%  numa-numastat.node=
0.numa_hit
>   46461 =C2=B1 81%    +102.6%      94126 =C2=B1 31%  numa-numastat.node0.=
other_node
>   0.00          -100.0%       0.00        numa-numastat.node1.interleave_=
hit
>   1571252 =C2=B1 18%     -14.3%    1346549 =C2=B1 13%  numa-numastat.node=
1.local_node
>  1663884 =C2=B1 16%     -16.3%    1393406 =C2=B1 13%  numa-numastat.node1=
.numa_hit
>     92593 =C2=B1 39%     -49.5%      46769 =C2=B1 61%  numa-numastat.node=
1.other_node

After skimming the attachments - started thinking that it is
undesirable to allocate
high order slabs from remote nodes.

--0000000000001f3de90600eb622a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mm-slub-do-not-allocate-from-remote-node-to-allocate.patch"
Content-Disposition: attachment; 
	filename="0001-mm-slub-do-not-allocate-from-remote-node-to-allocate.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lkb70bdj0>
X-Attachment-Id: f_lkb70bdj0

RnJvbSBkNjg4MjcwMjc0ZmViZjQxMTVjOWMyODcxMmQ4ZmYwOGNhMmJlZTFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIeWVvbmdnb24gWW9vIDw0Mi5oeWV5b29AZ21haWwuY29tPgpE
YXRlOiBUaHUsIDIwIEp1bCAyMDIzIDIyOjI5OjE2ICswOTAwClN1YmplY3Q6IFtQQVRDSF0gbW0v
c2x1YjogZG8gbm90IGFsbG9jYXRlIGZyb20gcmVtb3RlIG5vZGUgdG8gYWxsb2NhdGUgaGlnaAog
b3JkZXIgc2xhYgoKU2lnbmVkLW9mZi1ieTogSHllb25nZ29uIFlvbyA8NDIuaHlleW9vQGdtYWls
LmNvbT4KLS0tCiBtbS9zbHViLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tbS9zbHViLmMgYi9tbS9zbHViLmMKaW5k
ZXggZjc5NDAwNDgxMzhjLi4xZjI1ODg4ZDlhNDEgMTAwNjQ0Ci0tLSBhL21tL3NsdWIuYworKysg
Yi9tbS9zbHViLmMKQEAgLTIwMTIsNyArMjAxMiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2xhYiAqYWxs
b2NhdGVfc2xhYihzdHJ1Y3Qga21lbV9jYWNoZSAqcywgZ2ZwX3QgZmxhZ3MsIGludCBub2RlKQog
CSAqLwogCWFsbG9jX2dmcCA9IChmbGFncyB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQX05PUkVUUlkp
ICYgfl9fR0ZQX05PRkFJTDsKIAlpZiAoKGFsbG9jX2dmcCAmIF9fR0ZQX0RJUkVDVF9SRUNMQUlN
KSAmJiBvb19vcmRlcihvbykgPiBvb19vcmRlcihzLT5taW4pKQotCQlhbGxvY19nZnAgPSAoYWxs
b2NfZ2ZwIHwgX19HRlBfTk9NRU1BTExPQykgJiB+X19HRlBfUkVDTEFJTTsKKwkJYWxsb2NfZ2Zw
ID0gKChhbGxvY19nZnAgfCBfX0dGUF9USElTTk9ERSB8IF9fR0ZQX05PTUVNQUxMT0MpICYgfl9f
R0ZQX1JFQ0xBSU0pOwogCiAJc2xhYiA9IGFsbG9jX3NsYWJfcGFnZShhbGxvY19nZnAsIG5vZGUs
IG9vKTsKIAlpZiAodW5saWtlbHkoIXNsYWIpKSB7Ci0tIAoyLjQxLjAKCg==
--0000000000001f3de90600eb622a--
