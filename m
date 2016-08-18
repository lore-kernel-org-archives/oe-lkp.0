Content-Type: multipart/mixed; boundary="===============5262710913413812442=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Thu, 18 Aug 2016 20:45:42 +0800
Message-ID: <CADvbK_cF3Mphd5CDqGVHcbbZ-L8Xz=vRPzdKTzE4A_p-ZBiDVA@mail.gmail.com>
In-Reply-To: <20160818032156.GA5250@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5262710913413812442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> Hi, Aaron
>>
>> 1)
>> I talked with Marcelo about this one.
>> He said it might be related with cacheline.  the  new field distroyed
>> the prior cacheline. So on top of commit 826d253d57b1, pls only add
>> +       unsigned long prsctp_param;
>>
>> to the end of struct sctp_chunk, then try.
>
> This doesn't work.
>

If it's because of cache lines changed, I'm not sure this, either.
Maybe 2) is a good way to fix it.

Thanks Aaron.

>> 2)
>> if 1) still doesn't work, I may think about to drop prsctp_param in
>> sctp_chunk, and reuse msg->expire_at. as for sent_count, I will
>> put it to the mem hole of sctp_chunk.
>>
>> So pls also try the attachment patch,  on top of commit a6c2f792873a
>
> Good news, this brings the performance back on my Sandybridge desktop :)
> I have queued jobs to the Ivybridge test box but I guess the result is
> the same, but will let you know if it isn't.
>
> It looks like the size of the structure plays a role here, but not clear
> to me what happened underneath. Do you know why?
>
> Thanks,
> Aaron
>
>>
>> Thanks.
>
>> diff --git a/include/net/sctp/structs.h b/include/net/sctp/structs.h
>> index 6bcda71..008cb76 100644
>> --- a/include/net/sctp/structs.h
>> +++ b/include/net/sctp/structs.h
>> @@ -524,7 +524,11 @@ struct sctp_datamsg {
>>       struct list_head chunks;
>>       /* Reference counting. */
>>       atomic_t refcnt;
>> -     /* When is this message no longer interesting to the peer? */
>> +     /* Re-use this field to record param for prsctp policies,
>> +      * for TTL policy, it is the time_to_drop of this chunk,
>> +      * for RTX policy, it is the max_sent_count of this chunk,
>> +      * for PRIO policy, it is the priority of this chunk.
>> +      */
>>       unsigned long expires_at;
>>       /* Did the messenge fail to send? */
>>       int send_error;
>> @@ -553,6 +557,9 @@ struct sctp_chunk {
>>
>>       atomic_t refcnt;
>>
>> +     /* How many times this chunk have been sent, for prsctp RTX policy=
 */
>> +     int sent_count;
>> +
>>       /* This is our link to the per-transport transmitted list.  */
>>       struct list_head transmitted_list;
>>
>> @@ -602,16 +609,6 @@ struct sctp_chunk {
>>       /* This needs to be recoverable for SCTP_SEND_FAILED events. */
>>       struct sctp_sndrcvinfo sinfo;
>>
>> -     /* We use this field to record param for prsctp policies,
>> -      * for TTL policy, it is the time_to_drop of this chunk,
>> -      * for RTX policy, it is the max_sent_count of this chunk,
>> -      * for PRIO policy, it is the priority of this chunk.
>> -      */
>> -     unsigned long prsctp_param;
>> -
>> -     /* How many times this chunk have been sent, for prsctp RTX policy=
 */
>> -     int sent_count;
>> -
>>       /* Which association does this belong to?  */
>>       struct sctp_association *asoc;
>>
>> diff --git a/net/sctp/chunk.c b/net/sctp/chunk.c
>> index 2698d12..0c53d64 100644
>> --- a/net/sctp/chunk.c
>> +++ b/net/sctp/chunk.c
>> @@ -349,7 +349,7 @@ int sctp_chunk_abandoned(struct sctp_chunk *chunk)
>>       }
>>
>>       if (SCTP_PR_TTL_ENABLED(chunk->sinfo.sinfo_flags) &&
>> -         time_after(jiffies, chunk->prsctp_param)) {
>> +         time_after(jiffies, chunk->msg->expires_at)) {
>>               if (chunk->sent_count)
>>                       chunk->asoc->abandoned_sent[SCTP_PR_INDEX(TTL)]++;
>>               else
>> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
>> index 2c431ee..c7110a9 100644
>> --- a/net/sctp/sm_make_chunk.c
>> +++ b/net/sctp/sm_make_chunk.c
>> @@ -718,7 +718,7 @@ static void sctp_set_prsctp_policy(struct sctp_chunk=
 *chunk,
>>               return;
>>
>>       if (SCTP_PR_TTL_ENABLED(sinfo->sinfo_flags))
>> -             chunk->prsctp_param =3D
>> +             chunk->msg->expires_at =3D
>>                       jiffies + msecs_to_jiffies(sinfo->sinfo_timetolive=
);
>>  }
>>
>

--===============5262710913413812442==--

