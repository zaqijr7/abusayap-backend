const db = require('../helpers/db')

exports.createTopUp = (data) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO top_up
    (${Object.keys(data).join()})
    VALUES
    (${Object.values(data).map(item => `"${item}"`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.updateTopUp = (id, data) => {
  return new Promise((resolve, reject) => {
    const key = Object.keys(data)
    const value = Object.values(data)
    const query = db.query(`
      UPDATE top_up
      SET ${key.map((item, index) => `${item}="${value[index]}"`)}
      WHERE id=${id}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getTopUpByCondition = (cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT * FROM top_up WHERE ${Object.keys(cond).map(item => `${item}="${cond[item]}"`).join(' AND ')}
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getAllTopUp = (cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT t.*, CONCAT(u.firstname, ' ', u.lastname) as name
    FROM top_up t
    INNER JOIN users u ON u.id=t.idUser
    WHERE 
    ${cond.dateMin && cond.dateMax
        ? `AND dateTransaction BETWEEN '${cond.dateMin} 00:00:00'  AND '${cond.dateMax} 23:59:00' AND`
        : ''}
    t.id LIKE "%${cond.search}%"
    ORDER BY ${cond.sort} ${cond.order}
    LIMIT ${cond.limit} OFFSET ${cond.offset}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getCountAllTopUp = (cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT COUNT(t.id) as totalData 
    FROM top_up t
    INNER JOIN users u ON u.id=t.idUser
    WHERE 
    ${cond.dateMin && cond.dateMax
        ? `AND dateTransaction BETWEEN '${cond.dateMin} 00:00:00'  AND '${cond.dateMax} 23:59:00' AND`
        : ''}
    t.id LIKE "%${cond.search}%"
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}
